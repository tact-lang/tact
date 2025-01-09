import fs from "fs";
import path from "path";
import glob from "glob";
import { posixNormalize } from "../utils/filePath";
import { stdlibPath } from "./path";

const fromPath = path.resolve(stdlibPath, "**", "*.@(tact|fc)");
const toPath = path.resolve(__dirname, "stdlib.ts");

const stdlibFiles = glob.sync(fromPath, { windowsPathsNoEscape: true });
const dirPrefixToRemove = posixNormalize(stdlibPath) + "/"; // Remove also the leading slash
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
fs.writeFileSync(toPath, output);
