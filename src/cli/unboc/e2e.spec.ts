import { join, normalize } from "path";
import { makeCodegen, runCommand } from "@/cli/test-util.build";
import { step, attachment } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

// disable tests on windows
const testWin =
    process.platform === "win32" && process.env.CI ? test.skip : test;

const tact = (args: string) => {
    const tactPath = normalize(
        join(__dirname, "..", "..", "..", "bin", "tact.js"),
    );
    const command = `node ${tactPath} ${args}`;
    return runCommand(command);
};
const unboc = (...args: string[]) => {
    const unbocPath = normalize(
        join(__dirname, "..", "..", "..", "bin", "unboc.js"),
    );
    const command = `node ${unbocPath} ${args.join(" ")}`;
    return runCommand(command);
};

const codegen = makeCodegen(join(__dirname, "output"));

const goodContract = `
contract Test {
    get fun greeting(): String {
        return "hello world";
    }
}
`;

describe("unboc foo.boc", () => {
    testWin("Exits with correct code", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(r.outputPath("code.boc"));
        await step("Result exited with code 0", () => {
            expect(result).toMatchObject({ kind: "exited", code: 0 });
        });
    });

    testWin("Default run", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(r.outputPath("code.boc"));
        await step("CLI output should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    testWin("Without aliases", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc("--no-aliases", r.outputPath("code.boc"));
        await step("CLI output without aliases should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    testWin("Without refs", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(
            "--no-compute-refs",
            r.outputPath("code.boc"),
        );
        await step("CLI output without refs should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });

    testWin("With bitcode", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc("--show-bitcode", r.outputPath("code.boc"));
        await step("CLI output with bitcode should match snapshot", () => {
            expect(result).toMatchSnapshot();
        });
    });
});
