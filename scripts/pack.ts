import fs from "fs";
import path from "path";
import glob from "glob";
import { posixNormalize } from "../src/utils/filePath";

// Pack func
const wasmBase64 = fs
    .readFileSync(
        path.resolve(__dirname, "..", "src", "func", "funcfiftlib.wasm"),
    )
    .toString("base64");
const wasmBase64js = `module.exports = { FuncFiftLibWasm: '${wasmBase64}' };`;
fs.writeFileSync(
    path.resolve(__dirname, "..", "src", "func", "funcfiftlib.wasm.js"),
    wasmBase64js,
);

// Pack stdlib
const stdlibFiles = glob.sync(
    path.resolve(__dirname, "..", "stdlib", "**", "*.@(tact|fc)"),
    { windowsPathsNoEscape: true },
);
const dirPrefixToRemove =
    posixNormalize(path.resolve(__dirname, "..", "stdlib")) + "/"; // Remove also the leading slash
let output: string = "";
output = "const files: Record<string, string> = {};\n";
for (const f of stdlibFiles) {
    let code = fs.readFileSync(f).toString("base64");
    const name = f.replace(dirPrefixToRemove, "");
    output += `files['${name}'] =\n`;
    let first = true;
    while (code.length > 0) {
        if (first) {
            first = false;
        } else {
            output += " +\n";
        }
        output += `    '${code.slice(0, 128)}'`;
        code = code.slice(128);
    }
    output += `;\n`;
}
output += "export default files;";
fs.writeFileSync(
    path.resolve(__dirname, "..", "src", "imports", "stdlib.ts"),
    output,
);
