#!/usr/bin/env node

import pkg from "../package.json" with { type: "json" };
import * as main from "../dist/node.js";
import meow from "meow";

const cli = meow(
  `
Usage
  $ tact --config <config_path>
  
  or

  $ tact <contract>

Options
  --project <project_name>, -p <project_name>  Build the specified project from the config file 
  --version                                    Prints the current Tact version
  --func                                       Outputs the intermediate FunC code and stops
  --check                                      Performs type checking and stops
  --help                                       Displays this text

Examples
  $ tact --version
  ${pkg.version}
`,
  {
    importMeta: import.meta,
    flags: {
      config: { shortFlags: "c", type: "string" },
      project: { shortFlag: "p", type: "string", isMultiple: true },
      version: { shortFlag: "v", type: "boolean" },
      check: { type: "boolean" },
      func: { type: "boolean" },
    },
  },
);

if (cli.input.length > 1) {
  console.log("Only one contract can be specified at a time");
  cli.showHelp();
}

if (cli.input.length == 1 && cli.flags.config) {
  console.log("Either --config or a single Tact contract can be specified");
  cli.showHelp();
}

if (cli.flags.version) {
  cli.showVersion();
}

if (cli.flags.check && cli.flags.func) {
  console.log("--func and --check are mutually exclusive");
  cli.showHelp();
}

const success = await main.run({
  fileName: cli.input.at(0),
  configPath: cli.flags.config,
  projectNames: cli.flags.project ?? [],
  cliOptions: {
    checkOnly: cli.flags.check,
    func: cli.flags.func,
  },
});

process.exit(success ? 0 : 30);
