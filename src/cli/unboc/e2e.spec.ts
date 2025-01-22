import { join, normalize } from "path";
import { makeCodegen, runCommand } from "../test-util.build";

// disable tests on windows
const testWin = process.platform !== "win32" ? test : test.skip;

const tact = (args: string) => {
    const tactPath = normalize(
        join(__dirname, "..", "..", "..", "bin", "tact.js"),
    );
    const command = `node ${tactPath} ${args}`;
    return runCommand(command);
};
const unboc = (args: string) => {
    const unbocPath = normalize(
        join(__dirname, "..", "..", "..", "bin", "unboc.js"),
    );
    const command = `node ${unbocPath} ${args}`;
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
});
