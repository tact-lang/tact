#!/usr/bin/env node
/* eslint-disable @typescript-eslint/no-require-imports */

const meowModule = import("meow");
const { decompileAll } = require("@tact-lang/opcode");
const { readFileSync } = require("fs");

const unbocVersion = "0.0.1";

void meowModule.then(
    /** @param meow {import('meow/build/index')} */
    (meow) => {
        const cli = meow.default(
            `
    Usage
      $ unboc [...flags] BOC-FILE

    Flags
      -v, --version               Print unboc version and exit
      -h, --help                  Display this text and exit

    Examples
      $ unboc --version
      ${unbocVersion}`,
            {
                importMeta: {
                    url: new URL("file://" + __dirname + __filename).toString(),
                },
                description: `Command-line utility to disassemble a BoC (bag of cells) file with code and output TVM instructions to stdout`,
                autoVersion: false,
                flags: {
                    version: { shortFlag: "v", type: "boolean" },
                    help: { shortFlag: "h", type: "boolean" },
                },
                allowUnknownFlags: false,
            },
        );

        // Show help regardless of other flags
        if (cli.flags.help) {
            cli.showHelp(0);
        }

        // Show version regardless of other flags
        if (cli.flags.version) {
            console.log(unbocVersion);
            process.exit(0);
        }

        // Disallow specifying more than one boc file
        if (cli.input.length > 1) {
            console.error(
                "Error: Only one BoC file can be specified at a time.",
            );
            cli.showHelp(30);
        }

        // Show help when all flags and inputs are empty
        // Note, that version/help flags are already processed above and don't need to be mentioned here
        if (cli.input.length === 0) {
            cli.showHelp(0);
        }

        // Main command
        try {
            const boc = readFileSync(cli.input.at(0));
            const disasmResult = decompileAll({ src: Buffer.from(boc) });
            console.log(disasmResult);
            process.exit(0);
        } catch (error) {
            console.error(error.message);
            // https://nodejs.org/docs/v20.12.1/api/process.html#exit-codes
            process.exit(30);
        }
    },
);
