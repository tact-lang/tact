import fs from "fs";
import { join, relative } from "path";
import glob from "glob";
import { posixNormalize } from "../utils/filePath";
import { stdlibPath } from "./path";

const libFiles = join(__dirname, "stdlib", "**", "*.@(tact|fc)");
const targetPath = join(__dirname, "stdlib.ts");

const chunk = (s: string, chunkSize: number): string[] => {
    const result: string[] = [];
    for (let offset = 0; offset < s.length; offset += chunkSize) {
        result.push(s.slice(offset, offset + chunkSize));
    }
    return result;
};

const listFiles = (dir: string) => {
    const paths = glob.sync(dir, { windowsPathsNoEscape: true });
    const prefix = posixNormalize(stdlibPath);
    return paths.map((path) => {
        const relativePath = posixNormalize(relative(prefix, path));
        if (!relativePath.match(/^[-./_a-z0-9]+$/)) {
            console.error(
                `Standard library has file with invalid characters: ${path}`,
            );
            process.exit(30);
        }
        return {
            absolute: path,
            relative: relativePath,
        };
    });
};

const lines: string[] = [
    "const files: Record<string, string> = {};\n",
    ...listFiles(libFiles).map(({ absolute, relative }) => {
        const chunks = chunk(fs.readFileSync(absolute).toString("base64"), 128);
        const chunkedBase64 = chunks
            .map((chunk) => `    "${chunk}"`)
            .join(" +\n");
        return `files["${relative}"] =\n${chunkedBase64};\n`;
    }),
    "export default files;\n",
];

fs.writeFileSync(targetPath, lines.join(""));
