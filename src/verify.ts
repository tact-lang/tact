import normalize from "path-normalize";
import { Cell } from "ton-core";
import { Config, Options } from "./config/parseConfig";
import { PackageFileFormat, run } from "./main";
import { fileFormat } from "./packaging/fileFormat";
const version = require('../package.json').version;

export type VerifyResult = {
    ok: true,
    package: PackageFileFormat,
    files: { [key: string]: string }
} | {
    ok: false,
    error: 'invalid-package-format' | 'invalid-compiler' | 'invalid-compiler-version' | 'compilation-failed' | 'verification-failed'
};

export async function verify(pkg: string): Promise<VerifyResult> {

    // Loading package
    let unpacked: PackageFileFormat;
    try {
        let data = JSON.parse(pkg);
        unpacked = fileFormat.parse(data);
    } catch (e) {
        return { ok: false, error: 'invalid-package-format' };
    }

    // Check compier and version
    if (unpacked.compiler.name !== 'tact') {
        return { ok: false, error: 'invalid-compiler' };
    }
    if (unpacked.compiler.version !== version) {
        return { ok: false, error: 'invalid-compiler-version' };
    }

    // Create a options
    if (!unpacked.compiler.parameters) {
        return { ok: false, error: 'invalid-package-format' }
    }
    let params = JSON.parse(unpacked.compiler.parameters);
    if (typeof params.entrypoint !== 'string') {
        return { ok: false, error: 'invalid-package-format' }
    }
    let options: Options = params.options || {};
    let entrypoint: string = params.entrypoint;

    // Create config
    let config: Config = {
        projects: [{
            name: 'verifier',
            path: normalize('./contract/' + entrypoint),
            output: './output',
            options
        }]
    }

    // Build
    let files: { [key: string]: string } = {}
    for (let s in unpacked.sources) {
        files['contract/' + s] = unpacked.sources[s];
    }

    let result = await run({ config, files });
    if (!result) {
        return { ok: false, error: 'compilation-failed' };
    }

    // Read output
    let compiledCell = files['output/verifier_' + unpacked.name + '.code.boc'];
    if (!compiledCell) {
        return { ok: false, error: 'verification-failed' };
    }

    // Check output
    let a = Cell.fromBase64(compiledCell);
    let b = Cell.fromBase64(unpacked.code);
    if (!a.equals(b)) {
        return { ok: false, error: 'verification-failed' };
    }

    // Return
    return { ok: true, package: unpacked, files };
}