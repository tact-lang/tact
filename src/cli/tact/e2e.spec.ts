import { stat } from "fs/promises";
import { makeCodegen, runCommand } from "@/cli/test-util.build";
import { dirname, join, normalize } from "path";
import { attachment, step } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

// disable tests on windows
const testExceptWindows =
    process.platform === "win32" && process.env.CI ? test.skip : test;

const tact = (args: string) => {
    const tactPath = normalize(
        join(__dirname, "..", "..", "..", "bin", "tact.js"),
    );
    const command = `node ${tactPath} ${args}`;
    return runCommand(command);
};

const codegen = makeCodegen(join(__dirname, "output"));

describe("tact --version", () => {
    testExceptWindows("Exits with correct code", async () => {
        const result = await tact("--version");

        await step("Result exited with code 0", () => {
            expect(result).toMatchObject({ kind: "exited", code: 0 });
        });
    });

    testExceptWindows("Returns correct stdout", async () => {
        const result = await tact("--version");

        await step("Stdout contains version string", () => {
            expect(result).toHaveProperty(
                "stdout",
                expect.stringMatching(
                    /^\d+\.\d+\.\d+\ngit commit: [0-9a-f]+\n$/,
                ),
            );
        });
    });
});

const badContracts = [
    [
        "overflow",
        `contract Test {
            get fun getAscii_fail(): Int {
                return ascii("");
            }
        }`,
    ],
    [
        "duplicate",
        `message(1) Msg1 {}
        message(1) Msg2 {}

        contract Test {
            bounced(msg: Msg1) { }
            bounced(msg: Msg2) { }
        }`,
    ],
] as const;

describe("tact foo.tact", () => {
    testExceptWindows.each(badContracts)(
        "Compilation of broken contract doesn't contain stacktrace (%s)",
        async (name, code) => {
            const result = await tact(
                await codegen.contract(`no-err-${name}`, code),
            );

            await step("Stdout contains no stacktrace", () => {
                expect(result).toHaveProperty(
                    "stdout",
                    expect.not.stringMatching(/.*at \w+ \(.*/),
                );
            });
        },
    );

    test.skip.each(badContracts)(
        "Compilation of broken contract contains stacktrace with --verbose 2 (%s)",
        async (name, code) => {
            const result = await tact(
                `--verbose 2 ${await codegen.contract(`err-${name}`, code)}`,
            );

            expect(result).toHaveProperty(
                "stdout",
                expect.stringMatching(/.*at \w+ \(.*/),
            );
        },
    );
});

const goodContract = `
contract Test {
    get fun greeting(): String {
        return "hello world";
    }
    external("foobar") {}
}
`;

describe("tact foo.tact --...", () => {
    testExceptWindows(
        "Check single-contract compilation without flags",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(`single`, goodContract);
            const result = await tact(path);

            await step("Result exited with code 0", () => {
                expect(result).toMatchObject({ kind: "exited", code: 0 });
            });
        },
    );

    testExceptWindows(
        "Check single-contract compilation with custom output directory",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(`single-output`, goodContract);
            const customOutput = "custom-output";
            const result = await tact(`${path} --output ${customOutput}`);

            await step("Result exited with code 0", () => {
                expect(result).toMatchObject({ kind: "exited", code: 0 });
            });

            const statPromise = stat(join(dirname(path), customOutput));
            await step("Custom output directory exists", async () => {
                await expect(statPromise).resolves.not.toThrow();
            });
        },
    );

    testExceptWindows(
        "Check single-contract compilation with --check",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(`single-check`, goodContract);
            const result = await tact(`--check ${path}`);

            await step("Result exited with code 0", () => {
                expect(result).toMatchObject({ kind: "exited", code: 0 });
            });
        },
    );

    testExceptWindows(
        "Check single-contract compilation with --func",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(`single-func`, goodContract);
            const result = await tact(`--func ${path}`);

            await step("Result exited with code 0", () => {
                expect(result).toMatchObject({ kind: "exited", code: 0 });
            });
        },
    );

    testExceptWindows(
        "Check single-contract compilation with --with-decompilation",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(
                `single-decompile`,
                goodContract,
            );
            const result = await tact(`--with-decompilation ${path}`);

            await step("Result exited with code 0", () => {
                expect(result).toMatchObject({ kind: "exited", code: 0 });
            });
        },
    );
});

describe("tact --config config.json", () => {
    testExceptWindows("Complete results", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config("complete", goodContract, {
            options: { external: true },
            mode: "full",
        });

        const result = await tact(`--config ${r.config}`);
        await step("Result exited with code 0", () => {
            expect(result).toMatchObject({ kind: "exited", code: 0 });
        });

        const statPromise = stat(r.outputPath("pkg"));
        await step("Package directory exists", async () => {
            await expect(statPromise).resolves.not.toThrow();
        });
    });

    testExceptWindows("With decompiled binary", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config("decompile", goodContract, {
            options: { external: true },
            mode: "fullWithDecompilation",
        });

        const result = await tact(`--config ${r.config}`);
        await step("Result exited with code 0", () => {
            expect(result).toMatchObject({ kind: "exited", code: 0 });
        });

        const statPromise = stat(r.outputPath("rev.fif"));
        await step("Reverse binary file exists", async () => {
            await expect(statPromise).resolves.toMatchObject({});
        });
    });

    testExceptWindows("Mode passed as parameter takes priority", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const r = await codegen.config("priority", goodContract, {
            options: { external: true },
            mode: "full",
        });

        const result = await tact(`--check --config ${r.config}`);
        await step("Result exited with code 0", () => {
            expect(result).toMatchObject({ kind: "exited", code: 0 });
        });

        const statPromise = stat(r.outputPath("pkg"));
        await step("Package directory should not exist", async () => {
            await expect(statPromise).rejects.toThrow();
        });
    });
});

describe("tact -q foo.tact", () => {
    testExceptWindows("-q shows errors ", async () => {
        const path = await codegen.contract(
            `quiet`,
            `contract Test { x: Int = A }`,
        );
        const result = await tact(`-q ${path}`);

        await step("Stderr reports compilation error", () => {
            expect(
                result.kind === "exited" &&
                    result.stderr.includes("Cannot find 'A'"),
            ).toBe(true);
        });
        await step("Result exited with code 30", () => {
            expect(result).toMatchObject({ kind: "exited", code: 30 });
        });
    });
});

describe("Wrong flags", () => {
    testExceptWindows("--func --check are mutually exclusive ", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const path = await codegen.contract(`func-check`, goodContract);
        const result = await tact(`${path} --func --check`);

        await step("Result exited with code 30", () => {
            expect(result).toMatchObject({ kind: "exited", code: 30 });
        });
    });

    testExceptWindows(
        "--with-decompilation --check are mutually exclusive",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(
                `decompile-check`,
                goodContract,
            );
            const result = await tact(`${path} --with-decompilation --check`);

            await step("Result exited with code 30", () => {
                expect(result).toMatchObject({ kind: "exited", code: 30 });
            });
        },
    );

    testExceptWindows(
        "--func --with-decompilation are mutually exclusive",
        async () => {
            await attachment("Code", goodContract, ContentType.TEXT);
            const path = await codegen.contract(`func-decompile`, goodContract);
            const result = await tact(`${path} --func --with-decompilation`);

            await step("Result exited with code 30", () => {
                expect(result).toMatchObject({ kind: "exited", code: 30 });
            });
        },
    );

    testExceptWindows("Unknown flag throws error", async () => {
        await attachment("Code", goodContract, ContentType.TEXT);
        const path = await codegen.contract(`func-decompile`, goodContract);
        const result = await tact(`${path} --unknownOption`);

        await step("Result exited with code 30", () => {
            expect(result).toMatchObject({ kind: "exited", code: 30 });
        });
    });
});

describe("Compilation failures", () => {
    testExceptWindows("Exits with failure on wrong contracts", async () => {
        const badContract = `
        message(1) Msg1 {}
        message(1) Msg2 {}

        contract Test {
            bounced(msg: Msg1) { }
            bounced(msg: Msg2) { }
        }
        `;
        const r = await codegen.config("failure", badContract, {
            mode: "checkOnly",
        });

        const result = await tact(`--config ${r.config}`);
        await step("Result exited with code 30", () => {
            expect(result).toMatchObject({ kind: "exited", code: 30 });
        });
    });
});

describe("tact --eval", () => {
    testExceptWindows("Evaluate expression", async () => {
        const result = await tact(
            '-e "(1 + 2 * (pow(3,4) - 2) << 1 & 0x54 | 33 >> 1) * 2 + 2"',
        );

        await step("Stdout evaluates to 42", () => {
            expect(result).toHaveProperty(
                "stdout",
                expect.stringMatching("42\n"),
            );
        });
    });

    testExceptWindows(
        "Numerical literals get printed in decimal format: hex",
        async () => {
            const result = await tact('-e "0x2A"');

            await step("Stdout evaluates to 42", () => {
                expect(result).toHaveProperty(
                    "stdout",
                    expect.stringMatching("42\n"),
                );
            });
        },
    );

    testExceptWindows(
        "Numerical literals get printed in decimal format: dec",
        async () => {
            const result = await tact('-e "42"');

            await step("Stdout evaluates to 42", () => {
                expect(result).toHaveProperty(
                    "stdout",
                    expect.stringMatching("42\n"),
                );
            });
        },
    );

    testExceptWindows(
        "Numerical literals get printed in decimal format: oct",
        async () => {
            const result = await tact('-e "0o52"');

            await step("Stdout evaluates to 42", () => {
                expect(result).toHaveProperty(
                    "stdout",
                    expect.stringMatching("42\n"),
                );
            });
        },
    );

    testExceptWindows(
        "Numerical literals get printed in decimal format: bin",
        async () => {
            const result = await tact('-e "0b101010"');

            await step("Stdout evaluates to 42", () => {
                expect(result).toHaveProperty(
                    "stdout",
                    expect.stringMatching("42\n"),
                );
            });
        },
    );
});
