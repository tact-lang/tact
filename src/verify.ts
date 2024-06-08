import normalize from "path-normalize";
import { Cell } from "@ton/core";
import { Config, Options } from "./config/parseConfig";
import { consoleLogger } from "./logger";
import { PackageFileFormat, run, TactLogger } from "./main";
import { fileFormat } from "./packaging/fileFormat";
import { getCompilerVersion } from "./pipeline/version";

export type VerifyResult =
    | {
          ok: true;
          package: PackageFileFormat;
          files: { [key: string]: string };
      }
    | {
          ok: false;
          error:
              | "invalid-package-format"
              | "invalid-compiler"
              | "invalid-compiler-version"
              | "compilation-failed"
              | "verification-failed";
      };

export async function verify(args: {
    pkg: string;
    logger?: TactLogger | null | undefined;
}): Promise<VerifyResult> {
    const logger = args.logger || consoleLogger;

    // Loading package
    let unpacked: PackageFileFormat;
    try {
        const data = JSON.parse(args.pkg);
        unpacked = fileFormat.parse(data);
    } catch (e) {
        return { ok: false, error: "invalid-package-format" };
    }

    // Check compiler and version
    if (unpacked.compiler.name !== "tact") {
        return { ok: false, error: "invalid-compiler" };
    }
    if (unpacked.compiler.version !== getCompilerVersion()) {
        return { ok: false, error: "invalid-compiler-version" };
    }

    // Create a options
    if (!unpacked.compiler.parameters) {
        return { ok: false, error: "invalid-package-format" };
    }
    const params = JSON.parse(unpacked.compiler.parameters);
    if (typeof params.entrypoint !== "string") {
        return { ok: false, error: "invalid-package-format" };
    }
    const options: Options = params.options || {};
    const entrypoint: string = params.entrypoint;

    // Create config
    const config: Config = {
        projects: [
            {
                name: "verifier",
                path: normalize("./contract/" + entrypoint),
                output: "./output",
                options,
            },
        ],
    };

    // Build
    const files: { [key: string]: string } = {};
    for (const s in unpacked.sources) {
        files["contract/" + s] = unpacked.sources[s];
    }

    const result = await run({ config, files, logger });
    if (!result) {
        return { ok: false, error: "compilation-failed" };
    }

    // Read output
    const compiledCell =
        files["output/verifier_" + unpacked.name + ".code.boc"];
    if (!compiledCell) {
        return { ok: false, error: "verification-failed" };
    }

    // Check output
    const a = Cell.fromBase64(compiledCell);
    const b = Cell.fromBase64(unpacked.code);
    if (!a.equals(b)) {
        return { ok: false, error: "verification-failed" };
    }

    // Return
    return { ok: true, package: unpacked, files };
}
