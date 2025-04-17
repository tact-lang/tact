import os from "os";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import type { VirtualFileSystem } from "@/vfs/VirtualFileSystem";
import { mkdtemp } from "fs/promises";
import * as fs from "fs";
import * as path from "path";
import fc from "fast-check";

import type { NamedScopeItemKind, Scope } from "@/test/fuzzer/src/scope";
import { GlobalContext } from "@/test/fuzzer/src/context";
import type { Type } from "@/test/fuzzer/src/types";
import type * as Ast from "@/ast/ast";
import { nextId } from "@/test/fuzzer/src/id";
import { getSrcInfo } from "@/grammar/src-info";
import type { FactoryAst } from "@/ast/ast-helpers";
import { idText } from "@/ast/ast-helpers";
import { CompilerContext } from "@/context/context";
import { getParser } from "@/grammar";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import files from "@/stdlib/stdlib";
import { resolveImports } from "@/imports/resolveImports";
import { getRawAST, openContext, parseModules } from "@/context/store";
import type { MakeAstFactory } from "@/ast/generated/make-factory";
import { precompile } from "@/pipeline/precompile";
import { getAllTypes } from "@/types/resolveDescriptors";
import { topSortContracts } from "@/pipeline/utils";
import { featureEnable } from "@/config/features";
import { posixNormalize } from "@/utils/filePath";
import { compile } from "@/pipeline/compile";
import { funcCompile } from "@/func/funcCompile";
import { Logger } from "@/context/logger";
import { beginCell, Cell, contractAddress, TupleBuilder } from "@ton/core";
import type {
    StateInit,
    Address,
    Contract,
    ContractProvider,
    Sender,
    TupleItem,
} from "@ton/core";
import type { Blockchain, SandboxContract } from "@ton/sandbox";
import { enableFeatures } from "@/pipeline/build";

export const VALID_ID = /^[a-zA-Z_]+[a-zA-Z_0-9]$/;
export const VALID_TYPE_ID = /^[A-Z]+[a-zA-Z_0-9]$/;

/**
 * Creates a temp node file system to use inside a property.
 */
export async function withNodeFS(f: (vfs: VirtualFileSystem) => Promise<void>) {
    const tempDir = await mkdtemp(
        path.join(GlobalContext.config.compileDir, "tact-check-"),
    );
    const vfs = createNodeFileSystem(tempDir, false);
    try {
        await f(vfs);
    } finally {
        if (GlobalContext.config.compileDir == os.tmpdir()) {
            await fs.promises.rm(tempDir, { recursive: true });
        }
    }
}

/**
 * Creates a new property that executes additional logic implemented in tact-check.
 */
export function createProperty<Ts extends [unknown, ...unknown[]]>(
    ...args: [
        ...arbitraries: { [K in keyof Ts]: fc.Arbitrary<Ts[K]> },
        predicate: (...args: Ts) => boolean | void, // eslint-disable-line @typescript-eslint/no-invalid-void-type
    ]
): fc.IPropertyWithHooks<Ts> {
    const arbitraries = args.slice(0, -1) as unknown as {
        [K in keyof Ts]: fc.Arbitrary<Ts[K]>;
    };
    const originalPredicate = args[args.length - 1] as (
        ...args: Ts
    ) => boolean | void; // eslint-disable-line @typescript-eslint/no-invalid-void-type
    // eslint-disable-next-line @typescript-eslint/no-invalid-void-type
    const enhancedPredicate = (...args: Ts): boolean | void => {
        args.forEach((arg) => {
            GlobalContext.printSample(arg as Ast.AstNode);
        });
        return originalPredicate(...args);
    };
    return fc.property(...arbitraries, enhancedPredicate);
}

/**
 * Create parameters for custom property checking.
 */
function makeParams<T>(
    counterexamplePrinter: (generated: T) => string,
    numRuns: number | undefined,
): fc.Parameters<T> {
    return {
        numRuns: numRuns ?? GlobalContext.config.numRuns,
        seed: GlobalContext.config.seed,
        reporter(out) {
            if (out.failed) {
                let errorSufffix = "";
                if (out.counterexample !== null) {
                    errorSufffix = counterexamplePrinter(out.counterexample);
                }
                throw new Error(fc.defaultReportMessage(out) + errorSufffix);
            }
        },
    };
}
/**
 * Create parameters for custom property checking.
 */
function makeAsyncParams<T>(
    counterexamplePrinter: (generated: T) => string,
    numRuns: number | undefined,
): fc.Parameters<T> {
    return {
        numRuns: numRuns ?? GlobalContext.config.numRuns,
        seed: GlobalContext.config.seed,
        reporter: undefined,
        async asyncReporter(out) {
            if (out.failed) {
                let errorSuffix = "";
                if (out.counterexample !== null) {
                    errorSuffix =
                        counterexamplePrinter(out.counterexample) +
                        (out.errorInstance as Error).message;
                }
                throw new Error(
                    (await fc.asyncDefaultReportMessage(out)) + errorSuffix,
                );
            }
        },
    };
}

/**
 * Checks the given property enhancing `fc.assert` with additional functionality.
 */
export function checkProperty<T>(
    property: fc.IPropertyWithHooks<T>,
    counterexamplePrinter: (generated: T) => string,
    numRuns: number | undefined = undefined,
) {
    fc.assert(property, makeParams(counterexamplePrinter, numRuns));
}

/**
 * Checks the given async property enhancing `fc.assert` with additional functionality.
 */
export async function checkAsyncProperty<T>(
    property: fc.IAsyncPropertyWithHooks<T>,
    counterexamplePrinter: (generated: T) => string,
    numRuns: number | undefined = undefined,
) {
    await fc.assert(property, makeAsyncParams(counterexamplePrinter, numRuns));
}

export function astNodeCounterexamplePrinter(
    generated: Ast.AstNode | Ast.AstNode[],
) {
    const node = "kind" in generated ? generated : generated[0]!;
    return `\n-----\nGenerated ${node.kind}:\n${GlobalContext.format(node)}\n-----\n`;
}

/**
 * Creates a single fast-check sample with respect to the current global configuration.
 * @param gen The arbitrary generator used to create the sample.
 * @throws If the arbitrary cannot generate any elements.
 */
export function createSample<T>(gen: fc.Arbitrary<T>): T {
    const result = fc.sample(gen, {
        seed: GlobalContext.config.seed,
        numRuns: 1,
    })[0];
    if (typeof result === "undefined") {
        throw new Error("Unexpected 'undefined'");
    }
    return result;
}

/**
 * Generates an array of items using the provided generator function, with a length determined by a sampled range.
 * @param fn The generator function to create items.
 * @param minLength The minimum length of the array.
 * @param maxLength The maximum length of the array.
 * @returns An array of generated items.
 */
export function createSamplesArray<T>(
    fn: () => T,
    minLength: number,
    maxLength: number,
): T[] {
    const length = createSample(fc.integer({ min: minLength, max: maxLength }));
    return Array.from({ length }, () => fn());
}

/**
 * Generates a new valid identifier with a name unique within the current scope and with unique id.
 * @param shadowing Allow shadowing (using names available in parent scopes)
 */
export function generateName(
    scope: Scope,
    shadowing: boolean = true,
    isType: boolean = false,
): fc.Arbitrary<string> {
    const availableNames = shadowing
        ? scope.getAllNames()
        : scope.getAllNamesRecursive();

    return fc
        .stringMatching(isType ? VALID_TYPE_ID : VALID_ID)
        .filter((generatedName) => {
            if (availableNames.find(([name, _]) => name == generatedName)) {
                return false;
            }
            return true;
        });
}

/**
 * Generates Ast.Id from string name and with new id.
 */
export function generateAstIdFromName(name: string): Ast.Id {
    return {
        kind: "id",
        text: name,
        id: nextId(),
        loc: dummySrcInfoPrintable,
    };
}

/**
 * Generates Ast.Id.
 * @param scope Current scope, from which Ast.Id.text will be generated.
 * @param shadowing Allow shadowing (using names available in parent scopes)
 */
export function generateAstId(
    scope: Scope,
    shadowing: boolean = true,
    isType: boolean = false,
): fc.Arbitrary<Ast.Id> {
    return fc.record({
        kind: fc.constant("id"),
        text: generateName(scope, shadowing, isType),
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

/**
 * Chooses an arbitrary identifier available in the current scope.
 * @returns Chosen identifier or `undefined` if there are no identifiers available with the given kind/type.
 */
export function choose(
    scope: Scope,
    kind: NamedScopeItemKind,
    ty: Type,
): string | undefined {
    const availableNames = scope.getNamesRecursive(kind, ty);
    if (availableNames.length === 0) {
        return undefined;
    }
    return createSample(fc.constantFrom(...availableNames));
}

/**
 * Randomly chooses a boolean value using wrt to SEED.
 */
export function randomBool(): boolean {
    return createSample(fc.boolean());
}

/**
 * Randomly chooses an integer value using wrt to SEED.
 */
export function randomInt(min: number, max: number): number {
    return createSample(fc.integer({ min, max }));
}

/**
 * Chooses a random list element wrt to SEED.
 */
export function randomElement<T>(list: T[]): T {
    if (list.length === 0) {
        throw new Error("Empty list");
    }
    if (list.length === 1) {
        const result = list[0];
        if (typeof result === "undefined") {
            throw new Error("Unexpected 'undefined'");
        }
        return result;
    }
    const result = list[randomInt(1, list.length - 1)];
    if (typeof result === "undefined") {
        throw new Error("Unexpected 'undefined'");
    }
    return result;
}

export function packArbitraries<T>(
    arbs?: fc.Arbitrary<T>[],
): fc.Arbitrary<T[]> {
    return arbs ? fc.tuple(...(arbs as [fc.Arbitrary<T>])) : fc.constant([]);
}

export const dummySrcInfoPrintable = getSrcInfo(" ", 0, 0, null, "user");

export function stringify(obj: unknown, space: number): string {
    return JSON.stringify(
        obj,
        (_, value) => (typeof value === "bigint" ? value.toString() : value),
        space,
    );
}

/***
 * Utility functions for compiling contracts and sandbox them
 */

export function parseStandardLibrary(astF: FactoryAst): CompilerContext {
    let ctx = new CompilerContext();
    const parser = getParser(astF);
    const fileSystem = {
        [`contracts/empty.tact`]: "",
    };
    const project = createVirtualFileSystem("/", fileSystem, false);
    const stdlib = createVirtualFileSystem("@stdlib", files);

    const imported = resolveImports({
        entrypoint: "contracts/empty.tact",
        project,
        stdlib,
        parser,
    });

    // Add information about all the source code entries to the context
    ctx = openContext(
        ctx,
        imported.tact,
        imported.func,
        parseModules(imported.tact, getParser(astF)),
    );

    return ctx;
}

export function filterStdlib(
    ctx: CompilerContext,
    mF: MakeAstFactory,
    names: Set<string>,
): CustomStdlib {
    const result: Ast.ModuleItem[] = [];

    const rawAst = getRawAST(ctx);

    for (const c of rawAst.constants) {
        if (names.has(idText(c.name))) {
            result.push(c);
        }
    }

    for (const f of rawAst.functions) {
        if (names.has(idText(f.name))) {
            result.push(f);
        }
    }

    for (const t of rawAst.types) {
        if (names.has(idText(t.name))) {
            result.push(t);
        }
    }

    const customTactStdlib = mF.makeModule([], result);
    const stdlib_fc = fs
        .readFileSync(path.join(__dirname, "minimal-fc-stdlib", "stdlib.fc"))
        .toString("base64");

    return {
        modules: [customTactStdlib],
        stdlib_fc: stdlib_fc,
        stdlib_ex_fc: "",
    };
}

export type CustomStdlib = {
    // Parsed modules of Tact stdlib
    modules: Ast.Module[];
    // Contents of the stdlib.fc file
    stdlib_fc: string;
    // Contents of the stdlib_ex.fc file
    stdlib_ex_fc: string;
};

// If flag useCustomStdlib is false, it will parse the entire stdlib. Otherwise,
// it will use the provided data in CustomStdlib.
export async function buildModule(
    astF: FactoryAst,
    module: Ast.Module,
    customStdlib: CustomStdlib,
    blockchain: Blockchain,
): Promise<Map<string, SandboxContract<ProxyContract>>> {
    const parser = getParser(astF);
    // We need an entrypoint for precompile, even if it is empty
    const fileSystem = {
        [`contracts/empty.tact`]: "",
    };
    const minimalStdlib = {
        // Needed by precompile, but we set its contents to be empty
        ["std/stdlib.tact"]: "",
        // These two func files are needed during tvm compilation
        ["std/stdlib_ex.fc"]: customStdlib.stdlib_ex_fc,
        ["std/stdlib.fc"]: customStdlib.stdlib_fc,
    };

    const project = createVirtualFileSystem("/", fileSystem, false);
    const stdlib = createVirtualFileSystem("@stdlib", minimalStdlib);

    const config = {
        name: "test",
        path: "contracts/empty.tact",
        output: ".",
        options: {
            debug: true,
            external: true,
            ipfsAbiGetter: false,
            interfacesGetter: false,
            safety: {
                nullChecks: true,
            },
        },
    };

    const contractsToTest: Map<
        string,
        SandboxContract<ProxyContract>
    > = new Map();

    let ctx = new CompilerContext();
    const logger = new Logger();

    ctx = enableFeatures(ctx, logger, config);

    ctx = precompile(ctx, project, stdlib, config.path, parser, astF, [
        module,
        ...customStdlib.modules,
    ]);

    const built: Record<
        string,
        | {
              codeBoc: Buffer;
              abi: string;
          }
        | undefined
    > = {};

    const allContracts = getAllTypes(ctx).filter((v) => v.kind === "contract");

    // Sort contracts in topological order
    // If a cycle is found, return undefined
    const sortedContracts = topSortContracts(allContracts);
    if (sortedContracts !== undefined) {
        ctx = featureEnable(ctx, "optimizedChildCode");
    }
    for (const contract of sortedContracts ?? allContracts) {
        const contractName = contract.name;

        // Compiling contract to func
        const res = await compile(
            ctx,
            contractName,
            `${config.name}_${contractName}`,
            built,
        );
        const codeFc = res.output.files.map((v) => ({
            path: posixNormalize(project.resolve(config.output, v.name)),
            content: v.code,
        }));
        const codeEntrypoint = res.output.entrypoint;

        // Compiling contract to TVM
        const stdlibPath = stdlib.resolve("std/stdlib.fc");
        const stdlibCode = stdlib.readFile(stdlibPath).toString();
        const stdlibExPath = stdlib.resolve("std/stdlib_ex.fc");
        const stdlibExCode = stdlib.readFile(stdlibExPath).toString();

        const c = await funcCompile({
            entries: [
                stdlibPath,
                stdlibExPath,
                posixNormalize(project.resolve(config.output, codeEntrypoint)),
            ],
            sources: [
                {
                    path: stdlibPath,
                    content: stdlibCode,
                },
                {
                    path: stdlibExPath,
                    content: stdlibExCode,
                },
                ...codeFc,
            ],
            logger,
        });

        if (!c.ok) {
            throw new Error(c.log);
        }

        // Add to built map
        built[contractName] = {
            codeBoc: c.output,
            abi: "",
        };

        contractsToTest.set(
            contractName,
            blockchain.openContract(
                new ProxyContract(getContractStateInit(c.output)),
            ),
        );
    }

    return contractsToTest;
}

function getContractStateInit(contractCode: Buffer): StateInit {
    const data = beginCell().storeUint(0, 1).endCell();
    const code = Cell.fromBoc(contractCode)[0];
    if (typeof code === "undefined") {
        throw new Error("Code cell expected");
    }
    return { code, data };
}

export class ProxyContract implements Contract {
    address: Address;
    init: StateInit;

    constructor(stateInit: StateInit) {
        this.address = contractAddress(0, stateInit);
        this.init = stateInit;
    }

    async send(
        provider: ContractProvider,
        via: Sender,
        args: { value: bigint; bounce?: boolean | null | undefined },
        body?: Cell,
    ) {
        await provider.internal(via, { ...args, body: body });
    }

    async getInt(provider: ContractProvider) {
        const builder = new TupleBuilder();
        const result = (await provider.get("getInt", builder.build())).stack;
        return result.readBigNumber();
    }

    async getIndexed(provider: ContractProvider, index: number) {
        const builder = new TupleBuilder();
        const result = (await provider.get(`getInt${index}`, builder.build()))
            .stack;
        return result.readBigNumber();
    }

    async getGeneric(
        provider: ContractProvider,
        getterName: string,
        params: TupleItem[],
    ) {
        return (await provider.get(getterName, params)).stack;
    }
}
