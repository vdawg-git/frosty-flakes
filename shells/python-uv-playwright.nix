###
# software: [Python, UV, Playwright ]
###

{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = [
    pkgs.python312Packages.playwright
    pkgs.playwright-test
    pkgs.playwright-driver.browsers
    pkgs.uv
    pkgs.python312
  ];

  env = {
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = true;
    UV_PYTHON_DOWNLOADS = "never";
    UV_PYTHON_PREFERENCE = "only-system";
    UV_PYTHON = "${pkgs.python312}";
  };

  shellHook = ''
    # Create a virtual environment if it doesn't exist
    if [ ! -d ".venv" ]; then
      uv venv .venv
    fi

    source .venv/bin/activate
    echo "uv pip env ready"
  '';
}
