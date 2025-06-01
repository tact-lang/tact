import { compileCell, decompileCell } from "@/asm/runtime";
import { parse } from "@/asm/text/parse";
import { executeInstructions } from "@/asm/helpers/execute";
import { collectAsmCoverage, generateCoverageSummary } from "@/asm/coverage";
import { generateTextReport } from "@/asm/coverage/text";
import { generateHtml } from "@/asm/coverage/html";
import { mkdirSync, writeFileSync, existsSync } from "node:fs";

describe("asm coverage", () => {
    const test =
        (name: string, code: string, id: number = 0) =>
        async () => {
            const res = parse("test.asm", code);
            if (res.$ === "ParseFailure") {
                throw new Error(res.error.msg);
            }

            const cell = compileCell(res.instructions);
            const [_, logs] = await executeInstructions(res.instructions, id);
            const coverage = collectAsmCoverage(cell, logs);

            const summary = generateCoverageSummary(coverage);
            const report = generateTextReport(coverage, summary);
            expect(report).toMatchSnapshot();

            const outDirname = `${__dirname}/output`;
            if (!existsSync(outDirname)) {
                mkdirSync(outDirname);
            }

            const htmlReport = generateHtml(coverage);
            writeFileSync(`${__dirname}/output/${name}.html`, htmlReport);
        };

    it(
        "simple if",
        test(
            "simple if",
            `
                PUSHINT 0
                PUSHINT 0
                PUSHCONT {
                    INC
                    INC
                    INC
                }
                IF
            `,
        ),
    );

    it(
        "if ret",
        test(
            "if ret",
            `
                DROP
                PUSHINT -1 // cond

                IFRET

                PUSHINT 1
                PUSHINT 2
                ADD
            `,
        ),
    );

    it(
        "simple if-else",
        test(
            "simple if-else",
            `
                PUSHINT 0
                PUSHINT -1
                PUSHCONT {
                    INC
                }
                PUSHCONT {
                    DEC
                }
                IFELSE
            `,
        ),
    );

    it(
        "while loop with break",
        test(
            "while loop with break",
            `
                PUSHINT 10 // a = 10

                PUSHCONT { DUP GTINT 0 } // a > 0
                PUSHCONT {
                    // if (a < 5) { break }
                    DUP
                    LESSINT 5
                    IFRETALT

                    // a -= 1;
                    DEC
                }
                WHILEBRK
            `,
        ),
    );

    it(
        "dictionary",
        test(
            "dictionary",
            `
                DICTPUSHCONST 19 [
                    0 => {
                        PUSHINT 10
                        INC
                    }
                    2 => {
                        PUSHINT 5
                        INC
                    }
                ]
                DICTIGETJMPZ
                THROWARG 11
            `,
        ),
    );

    it(
        "dictionary 2",
        test(
            "dictionary 2",
            `
                DICTPUSHCONST 19 [
                    0 => {
                        PUSHINT 10
                        INC
                    }
                    2 => {
                        PUSHINT 5
                        INC
                    }
                ]
                DICTIGETJMPZ
                THROWARG 11
            `,
            2,
        ),
    );

    it(
        "try without throw",
        test(
            "try without throw",
            `
                PUSHINT 10
                PUSHCONT {
                    INC
                }
                PUSHCONT {
                    DEC
                }
                TRY
            `,
        ),
    );

    it(
        "try with throw",
        test(
            "try with throw",
            `
                PUSHINT 10
                PUSHCONT {
                    THROW 10
                }
                PUSHCONT {
                    SUB
                }
                TRY
            `,
        ),
    );

    it(
        "nested try with rethrow",
        test(
            "nested try with rethrow",
            `
                PUSHCONT {
                    PUSHCONT {
                        THROW 10
                    }
                    PUSHCONT {
                        THROWANY
                    }
                    TRY
                }
                PUSHCONT {
                    PUSHINT 2
                }
                TRY
            `,
        ),
    );

    // it("aaa", () => {
    //     const cell = Cell.fromHex("b5ee9c7241010a0100e5000228ff008e88f4a413f4bcf2c80bed5320e303ed43d9010602027102040121be28ef6a2687d20698facb6096d9e3610c030002210121bcd0c76a2687d20698facb6096d9e3610c0500022003e23001d072d721d200d200fa4021103450666f04f86102f862ed44d0fa40d31f596c1203925f03e07022d74920c21f953102d31f03de21c0018e9110235f030171db3cc85902cecb1fc9ed54e021c0028e915b01d31f3012db3cc85902cecb1fc9ed54e06c2232c00001c121b0e302f2c082070709010a59db3c58a0080010f84222c705f2e0840020f842c8cf8508ce70cf0b6ec98042fb00c6256793")
    //
    //     const { lines, summary } = collectAsmCoverage(cell, logs);
    //
    //     const report = generateTextReport(lines, summary);
    // })
});
