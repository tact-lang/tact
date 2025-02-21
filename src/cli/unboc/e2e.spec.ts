import { join, normalize } from "path";
import { makeCodegen, runCommand } from "../test-util.build";

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
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(r.outputPath("code.boc"));
        expect(result).toMatchObject({ kind: "exited", code: 0 });
    });

    testWin("Default run", async () => {
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(r.outputPath("code.boc"));
        expect(result).toMatchSnapshot();
    });

    testWin("Without aliases", async () => {
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc("--no-aliases", r.outputPath("code.boc"));
        expect(result).toMatchSnapshot();
    });

    testWin("Without refs", async () => {
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(
            "--no-compute-refs",
            r.outputPath("code.boc"),
        );
        expect(result).toMatchSnapshot();
    });

    testWin("With bitcode", async () => {
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc("--show-bitcode", r.outputPath("code.boc"));
        expect(result).toMatchSnapshot();
    });
});
