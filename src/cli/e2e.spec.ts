import { join } from "path";
import { runCommand } from "./run-command.build";
import { writeFile, mkdir, stat } from "fs/promises";
import { Config, ConfigProject } from "../config/parseConfig";

const binDir = join(__dirname, "..", "..", "bin");
const tact = (args: string) => {
    const command = `./tact.js ${args}`;
    console.error(command);
    return runCommand(command, binDir);
}

const outputDir = join(__dirname, "output");
const getOutDir = async () => {
    await mkdir(outputDir, { recursive: true });
    return outputDir;
};

const writeContract = async (name: string, code: string) => {
    const fullPath = join(await getOutDir(), `${name}.tact`);
    await writeFile(fullPath, code);
    return fullPath;
};

const writeConfig = async (name: string, code: string, partialConfig: Pick<ConfigProject, 'options' | 'mode'>) => {
    const outDir = await getOutDir();
    await writeFile(join(outDir, `${name}.tact`), code);
    const config: Config = {
        projects: [
            {
                name,
                path: `./${name}.tact`,
                output: `./${name}`,
                ...partialConfig,
            },
        ],
    };
    const configPath = join(outDir, `${name}.config.json`);
    await writeFile(configPath, JSON.stringify(config, null, 4));
    return {
        config: configPath,
        outputPath: (ext: string) => join(outDir, name, `${name}_Test.${ext}`),
    };
};

describe("tact --version", () => {
    test("Exits with correct code", async () => {
        const result = await tact("--version");

        expect(result).toMatchObject({ kind: "exited", code: 0 });
    });

    test("Returns correct stdout", async () => {
        const result = await tact("--version");

        expect(result).toHaveProperty(
            "stdout",
            expect.stringMatching(/^\d+\.\d+\.\d+\ngit commit: [0-9a-f]+\n$/),
        );
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
    test.each(badContracts)(
        "Compilation of broken contract doesn't contain stacktrace (%s)",
        async (name, code) => {
            const result = await tact(await writeContract(`no-err-${name}`, code));

            expect(result).toHaveProperty(
                "stdout",
                expect.not.stringMatching(/.*at \w+ \(.*/),
            );
        },
    );

    test.skip.each(badContracts)(
        "Compilation of broken contract contains stacktrace with --verbose 2 (%s)",
        async (name, code) => {
            const result = await tact(`--verbose 2 ${await writeContract(`err-${name}`, code)}`);

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

const flags = [
    ["without flags", ""],
    // ["with --check", "--check"],
    // ["with --func", "--func"],
    ["with --with-decompilation", "--with-decompilation"],
] as const;

describe.only("tact foo.tact", () => {
    test.each(flags)(
        "Check single-contract compilation %s",
        async (_text, flag) => {
            const path = await writeContract(`single-${flag}`, goodContract);
            const result = await tact(`${flag} ${path}`);

            console.error(result);
            expect(result).toMatchObject({ kind: "exited", code: 0 });
        },
    );
});

describe("tact --config config.json", () => {
    test('Complete results', async () => {
        const r = await writeConfig('complete', goodContract, {
            options: { external: true },
            mode: "full",
        });

        const result = await tact(`--config ${r.config}`);
        expect(result).toMatchObject({ kind: "exited", code: 0 });

        const statPromise = stat(r.outputPath('pkg'))
        await expect(statPromise).resolves.not.toThrow();
    });

    test('With decompiled binary', async () => {
        const r = await writeConfig('decompile', goodContract, {
            options: { external: true },
            mode: "fullWithDecompilation",
        });

        const result = await tact(`--config ${r.config}`);
        expect(result).toMatchObject({ kind: "exited", code: 0 });

        const statPromise = stat(r.outputPath('code.rev.fif'))
        await expect(statPromise).resolves.toMatchObject({});
    });

    test('Mode passed as parameter takes priority', async () => {
        const r = await writeConfig('priority', goodContract, {
            options: { external: true },
            mode: "full",
        });

        const result = await tact(`--check --config ${r.config}`);
        expect(result).toMatchObject({ kind: "exited", code: 0 });

        const statPromise = stat(r.outputPath('pkg'))
        await expect(statPromise).rejects.toThrow();
    });
});

describe("Wrong flags", () => {
    test('--func --check are mutually exclusive ', async () => {
        const path = await writeContract(`func-check`, goodContract);
        const result = await tact(`${path} --func --check`);

        expect(result).toMatchObject({ kind: "exited", code: 30 });
    });

    test('--with-decompilation --check are mutually exclusive', async () => {
        const path = await writeContract(`decompile-check`, goodContract);
        const result = await tact(`${path} --with-decompilation --check`);

        expect(result).toMatchObject({ kind: "exited", code: 30 });
    });

    test('--func --with-decompilation are mutually exclusive', async () => {
        const path = await writeContract(`func-decompile`, goodContract);
        const result = await tact(`${path} --func --with-decompilation`);

        expect(result).toMatchObject({ kind: "exited", code: 30 });
    });

    test('Unknown flag throws error', async () => {
        const path = await writeContract(`func-decompile`, goodContract);
        const result = await tact(`${path} --unknownOption`);

        expect(result).toMatchObject({ kind: "exited", code: 30 });
    });
});

describe('Compilation failures', () => {
    test('Exits with failure on wrong contracts', async () => {
        const badContract = `
        message(1) Msg1 {}
        message(1) Msg2 {}

        contract Test {
            bounced(msg: Msg1) { }
            bounced(msg: Msg2) { }
        }
        `;
        const r = await writeConfig('failure', badContract, {
            mode: "checkOnly",
        });

        const result = await tact(`--config ${r.config}`);
        expect(result).toMatchObject({ kind: "exited", code: 30 });
    })
});

describe("tact --eval", () => {
    test('Evaluate expressions', async () => {
        const result = await tact("-e '(1 + 2 * (pow(3,4) - 2) << 1 & 0x54 | 33 >> 1) * 2 + 2'");

        expect(result).toHaveProperty(
            "stdout",
            expect.stringMatching("42\n"),
        );
    });
});
