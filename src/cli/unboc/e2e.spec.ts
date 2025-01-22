// - name: CLI Test | Check TVM disassembler flag
// tact bin/test/success.tact
// unboc bin/test/success_HelloWorld.code.boc

import { join } from "path";
import { makeCodegen, runCommand } from "../test-util.build";

const binDir = join(__dirname, "..", "..", "..", "bin");
const tact = (args: string) => {
    const command = `./tact.js ${args}`;
    return runCommand(command, binDir);
};
const unboc = (args: string) => {
    const command = `./unboc.js ${args}`;
    return runCommand(command, binDir);
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
    test("Exits with correct code", async () => {
        const r = await codegen.config(`unboc`, goodContract, {});
        await tact(`-c ${r.config}`);
        const result = await unboc(r.outputPath("code.boc"));
        expect(result).toMatchObject({ kind: "exited", code: 0 });
    });
});
