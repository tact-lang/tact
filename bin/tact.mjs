#!/usr/bin/env node

import * as main from "../dist/node.js";
import meow from "meow";

const cli = meow(
  `
Usage
  $ tact --config <config_path>

Options
  --project <project_name>, -r <project_name>  
  --version                                    Prints the current tact version
  --func                                       Outputs the intermediate FunC code.
  --check                                      Performs type checking and stops.
  --help                                       Displays this text

Examples
  $ tact --version
  1.2.0
`,
  {
    importMeta: import.meta,
    flags: {
      config: { shortFlags: "c", type: "string", isRequired: true },
      project: { shortFlag: "p", type: "string", isMultiple: true },
      version: { shortflag: "v", type: "boolean" },
      check: { shortflag: "c", type: "boolean" },
      func: { shortFlag: "f", type: "boolean" },
    },
  },
);

if (cli.flags.version) {
  cli.showVersion();
}

if (cli.flags.check && cli.flags.func) {
  console.log("--func and --check are mutually exclusive");
  process.exit(30);
}

const success = await main.run({
  configPath: cli.flags.config,
  projectNames: cli.flags.project ?? [],
  checkOnly: cli.flags.check,
  func: cli.flags.func,
});

process.exit(success ? 0 : 30);
