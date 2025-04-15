import { join, normalize } from "path";
import { runCommand } from "@/cli/test-util.build";
import { readFileSync, rmSync, writeFileSync } from "fs";
import { mkdir } from "fs/promises";

// disable tests on windows
const testExceptWindows =
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

const badContract = `
contract /*comment*/ Test {
    get fun greeting(): String {
        return "hello world";
    }
}
`;

const contractWithSyntaxError = `
contract Test {
    get fun greeting(): String {
        return foo("hello world";
    }
}
`;

describe("tact-fmt foo.tact", () => {
    testExceptWindows("Exits with correct code", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contract.tact");
        writeFileSync(file, goodContract);
        const result = await tactFmt(file);
        expect(result).toMatchObject({ kind: "exited", code: 0 });

        rmSync(file);
    });

    testExceptWindows("Default run", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contract.tact");
        writeFileSync(file, goodContract);
        const result = await tactFmt(file);
        expect(result).toMatchSnapshot();

        rmSync(file);
    });

    testExceptWindows("Default run with write to file", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contract.tact");
        writeFileSync(file, goodContract);
        await tactFmt(file, "-w");

        const newContent = readFileSync(file, "utf8");
        expect(newContent).toMatchSnapshot();

        rmSync(file);
    });

    testExceptWindows("Run on directory", async () => {
        const dir = outputDir;
        const innerDir = join(dir, "inner");
        const innerInnerDir = join(innerDir, "inner-2");

        await mkdir(dir, { recursive: true });
        await mkdir(innerDir, { recursive: true });
        await mkdir(innerInnerDir, { recursive: true });

        // inner
        //   file1.tact
        //   inner-2
        //      file2.tact
        //      file3.tact
        const file1 = join(innerDir, "file1.tact");
        const file2 = join(innerInnerDir, "file2.tact");
        const file3 = join(innerInnerDir, "file3.tact");

        writeFileSync(file1, "fun foo1() {   }");
        writeFileSync(file2, "fun foo2() {  }");
        writeFileSync(file3, "fun foo3() {     }");

        await tactFmt(innerDir, "-w");

        expect(readFileSync(file1, "utf8")).toMatchSnapshot();
        expect(readFileSync(file2, "utf8")).toMatchSnapshot();
        expect(readFileSync(file3, "utf8")).toMatchSnapshot();

        rmSync(innerDir, { recursive: true });
    });

    testExceptWindows("Check on directory with formatted files", async () => {
        const dir = outputDir;
        const innerDir = join(dir, "inner");
        const innerInnerDir = join(innerDir, "inner-2");

        await mkdir(dir, { recursive: true });
        await mkdir(innerDir, { recursive: true });
        await mkdir(innerInnerDir, { recursive: true });

        // inner
        //   file1.tact
        //   inner-2
        //      file2.tact
        //      file3.tact
        const file1 = join(innerDir, "file1.tact");
        const file2 = join(innerInnerDir, "file2.tact");
        const file3 = join(innerInnerDir, "file3.tact");

        writeFileSync(file1, "fun foo1() {}\n");
        writeFileSync(file2, "fun foo2() {}\n");
        writeFileSync(file3, "fun foo3() {}\n");

        const result = await tactFmt(innerDir, "--check");
        expect(result).toMatchSnapshot();

        rmSync(innerDir, { recursive: true });
    });

    testExceptWindows(
        "Check on directory with not formatted files",
        async () => {
            const dir = outputDir;
            const innerDir = join(dir, "inner");
            const innerInnerDir = join(innerDir, "inner-2");

            await mkdir(dir, { recursive: true });
            await mkdir(innerDir, { recursive: true });
            await mkdir(innerInnerDir, { recursive: true });

            // inner
            //   file1.tact
            //   inner-2
            //      file2.tact
            //      file3.tact
            const file1 = join(innerDir, "file1.tact");
            const file2 = join(innerInnerDir, "file2.tact");
            const file3 = join(innerInnerDir, "file3.tact");

            writeFileSync(file1, "fun foo1() {  }\n");
            writeFileSync(file2, "fun foo2() {  }\n");
            writeFileSync(file3, "fun foo3() {  }\n");

            const result = await tactFmt(innerDir, "--check");
            expect(result).toMatchSnapshot();

            rmSync(innerDir, { recursive: true });
        },
    );

    testExceptWindows("With error", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contract.tact");
        writeFileSync(file, badContract);
        const result = await tactFmt(file);
        expect(result).toMatchObject({ kind: "exited", code: 1 });

        rmSync(file);
    });

    testExceptWindows("With syntax error", async () => {
        await mkdir(outputDir, { recursive: true });
        const file = join(outputDir, "contact.tact");
        writeFileSync(file, contractWithSyntaxError);
        const result = await tactFmt(file, "-w");
        expect(result).toMatchSnapshot();

        rmSync(file);
    });
});
