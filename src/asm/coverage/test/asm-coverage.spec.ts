import { compileCell } from "@/asm/runtime";
import { parse } from "@/asm/text/parse";
import { executeInstructions } from "@/asm/helpers/execute";
import { collectAsmCoverage } from "@/asm/coverage/index";
import { generateTextReport } from "@/asm/coverage/text";
import { generateHtml } from "@/asm/coverage/html";
import { mkdirSync, writeFileSync, existsSync } from "node:fs";
import { step } from "@/test/allure/allure";

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
            const { lines, summary } = collectAsmCoverage(cell, logs);

            const report = await step("Generating text report", () => {
                return generateTextReport(lines, summary);
            });
            await step("Report should match snapshot", () => {
                expect(report).toMatchSnapshot();
            });
            const outDirname = `${__dirname}/output`;
            if (!existsSync(outDirname)) {
                mkdirSync(outDirname);
            }

            const htmlReport = await step("Generating HTML report", () => {
                return generateHtml(lines);
            });
            await step("Write html report", () => {
                writeFileSync(`${__dirname}/output/${name}.html`, htmlReport);
            });
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
});
