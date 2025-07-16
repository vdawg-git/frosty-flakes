import { defineCollection, z } from "astro:content"
import { readdir } from "node:fs/promises"

const shellSchema = z.object({
  id: z.string(),
  /**
   * Specify the programming languages, libraries and tools used.
   */
  tags: z.string().array().min(1),
  description: z.string(),
  /** Update when there was a bigger change,
   *  so that the user knows that the shell is not outdated.
   *
   *  Do not update the date for typos or stylistic improvments.
   */
  updatedAt: z.date().min(new Date("2020-02-02"))
})

const shells = defineCollection({
  schema: shellSchema,
  loader: async () => {
    return readdir("")
  }
})
