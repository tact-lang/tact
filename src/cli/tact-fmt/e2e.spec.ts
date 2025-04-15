import { join, normalize } from "path";
import { runCommand } from "@/cli/test-util.build";
import { readFileSync, writeFileSync } from "fs";
import { mkdir } from "fs/promises";

// disable tests on windows
const testWin =
    process.platform === "win32" && process.env.CI ? test.skip : test;

const tactFmt = (...args: string[]) => {
    const unbocPath = normalize(
        join(__dirname, "..", "..", "..", "bin", "tact-fmt.js"),
    );
    const command = `node ${unbocPath} ${args.join(" ")}`;
    return runCommand(command);
};

const outputDir = join(__dirname, "output");

const goodContract = `
contract Test {
    get fun greeting(): String {
        return "hello world";
    }
}
`;

describe("tact-fmt foo.tact", () => {
    testWin("Exits with correct code", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contact.tact");
        writeFileSync(file, goodContract);
        const result = await tactFmt(file);
        expect(result).toMatchObject({ kind: "exited", code: 0 });
    });

    testWin("Default run", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contact.tact");
        writeFileSync(file, goodContract);
        const result = await tactFmt(file);
        expect(result).toMatchSnapshot();
    });

    testWin("Default run with write to file", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contact.tact");
        writeFileSync(file, goodContract);
        const result = await tactFmt(file, "-w");
        expect(result).toMatchSnapshot();

        const newContent = readFileSync(file, "utf8");
        expect(newContent).toMatchSnapshot();
    });
});
