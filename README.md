# Local REST API for Obsidian

See our interactive docs: https://coddingtonbear.github.io/obsidian-local-rest-api/

Have you ever needed to automate interacting with your notes?  This plugin gives Obsidian a REST API you can interact with your notes from other tools so you can automate what you need to automate.

This plugin provides a secure HTTPS interface gated behind api key authentication that allows you to:

- Read, create, update or delete existing notes.  There's even a `PATCH` HTTP method for inserting content into a particular section of a note.
- List notes stored in your vault.
- Create and fetch periodic notes.
- Execute commands and list what commands are available.

This is particularly useful if you need to interact with Obsidian from a browser extension like [Obsidian Web](https://chrome.google.com/webstore/detail/obsidian-web/edoacekkjanmingkbkgjndndibhkegad).

## Credits

This was inspired by [Vinzent03](https://github.com/Vinzent03)'s [advanced-uri plugin](https://github.com/Vinzent03/obsidian-advanced-uri) with hopes of expanding the automation options beyond the limitations of custom URL schemes.

## About this fork

This project is forked from [coddingtonbear/obsidian-local-rest-api](https://github.com/coddingtonbear/obsidian-local-rest-api). Many thanks to **@coddingtonbear** for the original concept. While the original plugin works well, its endpoints were not ideal for ChatGPT usage. This fork adjusts endpoint descriptions and adds `context-type` support so that ChatGPT can use the API directly.

For instructions on integrating this plugin with GPTs, please see <https://github.com/bincyan/obsidian-chatgpt-gpts-integration>.

## Release Process

When a git tag is pushed, a GitHub Actions workflow will automatically build the
plugin and regenerate `docs/openapi.yaml`. The workflow runs `npm run build-docs`
before `npm run build` so that the latest OpenAPI specification is embedded in
the release artifacts. After building, the workflow commits the updated
`docs/openapi.yaml` back to the `main` branch so the repository always contains
the newest spec.

The build output (`main.js` with the bundled OpenAPI spec) is **not** committed
to the repository. The workflow generates these files on the fly and uploads
them as release assets.

