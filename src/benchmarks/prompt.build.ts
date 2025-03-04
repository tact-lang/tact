import { createInterface } from "readline/promises";
import { getCompilerVersion } from "../pipeline/version";
import { writeFile, mkdir } from "fs/promises";
import { join } from "path";

const main = async () => {
    const readline = createInterface({
        input: process.stdin,
        output: process.stdout,
    });

    const version = getCompilerVersion();

    const label = await readline.question(`Benchmark label: `);
    const prNumber = await readline.question("PR number: ");

    const fileLabel = label === "" ? version : `${version} with ${label}`;

    const filePr =
        prNumber === ""
            ? null
            : `https://github.com/tact-lang/tact/pull/${prNumber}`;

    await mkdir(join(__dirname, `output`), { recursive: true });

    await writeFile(
        join(__dirname, `output`, `prompt.json`),
        JSON.stringify({
            label: fileLabel,
            pr: filePr,
        }),
    );

    readline.close();
};

void main();
