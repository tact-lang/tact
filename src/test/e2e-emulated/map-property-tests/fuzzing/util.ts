import type * as Ast from "@/ast/ast";
import { idText, type FactoryAst } from "@/ast/ast-helpers";
import { featureEnable } from "@/config/features";
import { CompilerContext } from "@/context/context";
import { Logger } from "@/context/logger";
import { funcCompile } from "@/func/funcCompile";
import { getParser } from "@/grammar";
import { compile } from "@/pipeline/compile";
import { precompile } from "@/pipeline/precompile";
import { topSortContracts } from "@/pipeline/utils";
import files from "@/stdlib/stdlib";
import * as fs from "fs";
import { posixNormalize } from "@/utils/filePath";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import type {
    Address,
    Builder,
    Contract,
    ContractProvider,
    DictionaryKey,
    DictionaryKeyTypes,
    DictionaryValue,
    Sender,
    StateInit,
    TupleItem,
    TupleReader,
} from "@ton/core";
import { Cell, Dictionary } from "@ton/core";
import { beginCell, contractAddress, TupleBuilder } from "@ton/core";
import { resolveImports } from "@/imports/resolveImports";
import { getRawAST, openContext, parseModules } from "@/context/store";
import path from "path";
import { getAllTypes } from "@/types/resolveDescriptors";
import type { MakeAstFactory } from "@/ast/generated/make-factory";
import * as fc from "fast-check";
import { TreasuryContract } from "@ton/sandbox";
import type { SandboxContract } from "@ton/sandbox";
import { sha256_sync } from "@ton/crypto";

export const keyTypes = [
    "Int",
    "Address",
    "Int as uint8",
    "Int as uint16",
    "Int as uint32",
    "Int as uint64",
    "Int as uint128",
    "Int as uint256",
    "Int as int8",
    "Int as int16",
    "Int as int32",
    "Int as int64",
    "Int as int128",
    "Int as int256",
    "Int as int257",
] as const;

export const valueTypes = [
    "Int",
    "Bool",
    "Address",
    "Cell",
    "Int as uint8",
    "Int as uint16",
    "Int as uint32",
    "Int as uint64",
    "Int as uint128",
    "Int as uint256",
    "Int as int8",
    "Int as int16",
    "Int as int32",
    "Int as int64",
    "Int as int128",
    "Int as int256",
    "Int as int257",
    "Int as coins",
] as const;

export type keyType = (typeof keyTypes)[number];
export type valueType = (typeof valueTypes)[number];
export type keyValueTypes = keyType | valueType;

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

export function filterGlobalDeclarations(
    ctx: CompilerContext,
    mF: MakeAstFactory,
    names: Set<string>,
): Ast.Module {
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

    return mF.makeModule([], result);
}

export function loadCustomStdlibFc(): {
    stdlib_fc: string;
    stdlib_ex_fc: string;
} {
    const stdlib_fc = fs
        .readFileSync(path.join(__dirname, "minimal-fc-stdlib", "stdlib.fc"))
        .toString("base64");
    return {
        stdlib_fc: stdlib_fc,
        stdlib_ex_fc: "",
    };
}

type CustomStdlib = {
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
    useCustomStdlib: boolean,
): Promise<Map<string, Buffer>> {
    let ctx = new CompilerContext();
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
    // If the provided stdlib modules are empty, prepare the full stdlib.
    // Otherwise, just include the minimal stdlib
    const stdlib = useCustomStdlib
        ? createVirtualFileSystem("@stdlib", minimalStdlib)
        : createVirtualFileSystem("@stdlib", files);

    const config = {
        name: "test",
        path: "contracts/empty.tact",
        output: ".",
    };
    const contractCodes = new Map();

    if (useCustomStdlib) {
        ctx = precompile(ctx, project, stdlib, config.path, parser, astF, [
            module,
            ...customStdlib.modules,
        ]);
    } else {
        ctx = precompile(ctx, project, stdlib, config.path, parser, astF, [
            module,
        ]);
    }

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
            logger: new Logger(),
        });

        if (!c.ok) {
            throw new Error(c.log);
        }

        // Add to built map
        built[contractName] = {
            codeBoc: c.output,
            abi: "",
        };

        contractCodes.set(contractName, c.output);
    }

    return contractCodes;
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
        body: Cell,
    ) {
        await provider.internal(via, { ...args, body: body });
    }

    async getWholeMap(provider: ContractProvider, params: TupleItem[]) {
        return (await provider.get("wholeMap", params)).stack;
    }

    async getGetValue(provider: ContractProvider, params: TupleItem[]) {
        return (await provider.get("getValue", params)).stack;
    }

    async getExists(provider: ContractProvider, params: TupleItem[]) {
        return (await provider.get("exists", params)).stack;
    }
}

// We need to do this indirection (i.e., not placing the entire code of this
// function inside the "getWholeMap" in the ProxyContract class, and similarly for the rest
// of the contract getters) because SandboxContract for some reason messes up the generics.
export async function getWholeMap<K extends DictionaryKeyTypes, V>(
    contract: SandboxContract<ProxyContract>,
    kHandler: KeyTypeHandler<K>,
    vHandler: ValueTypeHandler<V>,
) {
    const builder = new TupleBuilder();
    const reader = await contract.getWholeMap(builder.build());
    return Dictionary.loadDirect(
        kHandler.getDictionaryKeyType(),
        vHandler.getDictionaryValueType(),
        reader.readCellOpt(),
    );
}

export async function getGetValue<K extends DictionaryKeyTypes, V>(
    contract: SandboxContract<ProxyContract>,
    key: K,
    kHandler: KeyTypeHandler<K>,
    vHandler: ValueTypeHandler<V>,
) {
    const builder = new TupleBuilder();
    kHandler.storeInTupleBuilder(key, builder);
    const source = await contract.getGetValue(builder.build());
    const result = vHandler.readOptionalFromTupleReader(source);
    return result;
}

export async function getExists<K extends DictionaryKeyTypes>(
    contract: SandboxContract<ProxyContract>,
    key: K,
    kHandler: KeyTypeHandler<K>,
) {
    const builder = new TupleBuilder();
    kHandler.storeInTupleBuilder(key, builder);
    const source = await contract.getExists(builder.build());
    const result = source.readBoolean();
    return result;
}

export function getContractStateInit(contractCode: Buffer): StateInit {
    const data = beginCell().storeUint(0, 1).endCell();
    const code = Cell.fromBoc(contractCode)[0];
    if (typeof code === "undefined") {
        throw new Error("Code cell expected");
    }
    return { code, data };
}

export function createDict<K extends DictionaryKeyTypes, V>(
    initialKeyValuePairs: [K, V][],
    kHandler: KeyTypeHandler<K>,
    vHandler: ValueTypeHandler<V>,
) {
    const dict = Dictionary.empty(
        kHandler.getDictionaryKeyType(),
        vHandler.getDictionaryValueType(),
    );
    for (const [k, v] of initialKeyValuePairs) {
        dict.set(k, v);
    }
    return dict;
}

// The interface responsible for handling methods specific for types acting
// as keys in dictionaries
export interface KeyTypeHandler<K extends DictionaryKeyTypes> {
    getDictionaryKeyType(): DictionaryKey<K>;
    getGenerator(): fc.Arbitrary<K>;
    storeInCellBuilder(v: K, builder: Builder): void;
    storeInTupleBuilder(v: K, builder: TupleBuilder): void;
}

// The interface responsible for handling methods specific for types acting
// as values in dictionaries
export interface ValueTypeHandler<V> {
    getDictionaryValueType(): DictionaryValue<V>;
    getGenerator(): fc.Arbitrary<V>;
    storeInCellBuilder(v: V, builder: Builder): void;
    readOptionalFromTupleReader(reader: TupleReader): V | undefined;
    equals(o1: V | undefined, o2: V | undefined): boolean;
}

// This type represents the existential type (sigma type):
// exists T. KeyTypeHandler<T>
type ExistsKeyTypeHandler = <R>(
    cont: <T extends DictionaryKeyTypes>(handler: KeyTypeHandler<T>) => R,
) => R;

// This type represents the existential type (sigma type):
// exists T. ValueTypeHandler<T>
type ExistsValueTypeHandler = <R>(
    cont: <T>(handler: ValueTypeHandler<T>) => R,
) => R;

// The constructor for the existential type for KeyTypeHandler
function constructKeyTypeExistential<T extends DictionaryKeyTypes>(
    handler: KeyTypeHandler<T>,
): ExistsKeyTypeHandler {
    return <R>(
        cont: <K extends DictionaryKeyTypes>(h: KeyTypeHandler<K>) => R,
    ) => cont(handler);
}

// The constructor for the existential type for ValueTypeHandler
function constructValueTypeExistential<T>(
    handler: ValueTypeHandler<T>,
): ExistsValueTypeHandler {
    return <R>(cont: <K>(h: ValueTypeHandler<K>) => R) => cont(handler);
}

export function getKeyTypeHandler(kT: keyType): ExistsKeyTypeHandler {
    const handler = getTypeHandlers(kT)[0];
    if (typeof handler === "undefined") {
        throw new Error(`${kT} does not have a key type handler`);
    }
    return handler;
}

export function getValueTypeHandler(vT: valueType): ExistsValueTypeHandler {
    return getTypeHandlers(vT)[1];
}

// This function returns both the key type handler and value type handler for each possible
// dictionary type. Some dictionary types do not have a key type handler; for example, "Bool"
// does not have a key type handler because it cannot act as keys in a dictionary.
// For such types, the function returns "undefined" in the first position of the tuple.
function getTypeHandlers(
    kvT: keyValueTypes,
): [ExistsKeyTypeHandler | undefined, ExistsValueTypeHandler] {
    switch (kvT) {
        case "Int": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigInt(257),
                    getGenerator: () => _generateIntBitLength(257, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 257),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.BigInt(257),
                    getGenerator: () => _generateIntBitLength(257, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 257),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Address": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Address(),
                    getGenerator: () => _generateAddress(),
                    storeInCellBuilder: (v: Address, builder: Builder) =>
                        builder.storeAddress(v),
                    storeInTupleBuilder: (
                        v: Address,
                        builder: TupleBuilder,
                    ) => {
                        builder.writeAddress(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Address(),
                    getGenerator: () => _generateAddress(),
                    storeInCellBuilder: (v: Address, builder: Builder) =>
                        builder.storeAddress(v),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readAddressOpt() ?? undefined,
                    equals: (
                        o1: Address | undefined,
                        o2: Address | undefined,
                    ) => {
                        if (
                            typeof o1 !== "undefined" &&
                            typeof o2 !== "undefined"
                        ) {
                            return o1.equals(o2);
                        } else {
                            return o1 === o2;
                        }
                    },
                }),
            ];
        }
        case "Bool": {
            return [
                undefined,
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Bool(),
                    getGenerator: () => fc.boolean(),
                    storeInCellBuilder: (v: boolean, builder: Builder) =>
                        builder.storeBit(v),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBooleanOpt() ?? undefined,
                    equals: (
                        o1: boolean | undefined,
                        o2: boolean | undefined,
                    ) => o1 === o2,
                }),
            ];
        }
        case "Cell": {
            return [
                undefined,
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Cell(),
                    getGenerator: () => _generateCell(),
                    storeInCellBuilder: (v: Cell, builder: Builder) =>
                        builder.storeRef(v),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readCellOpt() ?? undefined,
                    equals: (o1: Cell | undefined, o2: Cell | undefined) => {
                        if (
                            typeof o1 !== "undefined" &&
                            typeof o2 !== "undefined"
                        ) {
                            return o1.equals(o2);
                        } else {
                            return o1 === o2;
                        }
                    },
                }),
            ];
        }
        case "Int as int8": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Int(8),
                    getGenerator: () =>
                        _generateIntBitLength(8, true).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeInt(v, 8),
                    storeInTupleBuilder: (v: number, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Int(8),
                    getGenerator: () =>
                        _generateIntBitLength(8, true).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeInt(v, 8),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readNumberOpt() ?? undefined,
                    equals: (o1: number | undefined, o2: number | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as int16": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Int(16),
                    getGenerator: () =>
                        _generateIntBitLength(16, true).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeInt(v, 16),
                    storeInTupleBuilder: (v: number, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Int(16),
                    getGenerator: () =>
                        _generateIntBitLength(16, true).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeInt(v, 16),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readNumberOpt() ?? undefined,
                    equals: (o1: number | undefined, o2: number | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as int32": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Int(32),
                    getGenerator: () =>
                        _generateIntBitLength(32, true).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeInt(v, 32),
                    storeInTupleBuilder: (v: number, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Int(32),
                    getGenerator: () =>
                        _generateIntBitLength(32, true).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeInt(v, 32),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readNumberOpt() ?? undefined,
                    equals: (o1: number | undefined, o2: number | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as int64": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigInt(64),
                    getGenerator: () => _generateIntBitLength(64, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 64),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.BigInt(64),
                    getGenerator: () => _generateIntBitLength(64, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 64),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as int128": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigInt(128),
                    getGenerator: () => _generateIntBitLength(128, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 128),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.BigInt(128),
                    getGenerator: () => _generateIntBitLength(128, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 128),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as int256": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigInt(256),
                    getGenerator: () => _generateIntBitLength(256, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 256),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.BigInt(256),
                    getGenerator: () => _generateIntBitLength(256, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 256),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as int257": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigInt(257),
                    getGenerator: () => _generateIntBitLength(257, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 257),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.BigInt(257),
                    getGenerator: () => _generateIntBitLength(257, true),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeInt(v, 257),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as uint8": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Uint(8),
                    getGenerator: () =>
                        _generateIntBitLength(8, false).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeUint(v, 8),
                    storeInTupleBuilder: (v: number, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Uint(8),
                    getGenerator: () =>
                        _generateIntBitLength(8, false).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeUint(v, 8),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readNumberOpt() ?? undefined,
                    equals: (o1: number | undefined, o2: number | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as uint16": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Uint(16),
                    getGenerator: () =>
                        _generateIntBitLength(16, false).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeUint(v, 16),
                    storeInTupleBuilder: (v: number, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Uint(16),
                    getGenerator: () =>
                        _generateIntBitLength(16, false).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeUint(v, 16),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readNumberOpt() ?? undefined,
                    equals: (o1: number | undefined, o2: number | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as uint32": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.Uint(32),
                    getGenerator: () =>
                        _generateIntBitLength(32, false).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeUint(v, 32),
                    storeInTupleBuilder: (v: number, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.Uint(32),
                    getGenerator: () =>
                        _generateIntBitLength(32, false).map((n) => Number(n)),
                    storeInCellBuilder: (v: number, builder: Builder) =>
                        builder.storeUint(v, 32),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readNumberOpt() ?? undefined,
                    equals: (o1: number | undefined, o2: number | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as uint64": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigUint(64),
                    getGenerator: () => _generateIntBitLength(64, false),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeUint(v, 64),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () => Dictionary.Values.BigUint(64),
                    getGenerator: () => _generateIntBitLength(64, false),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeUint(v, 64),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as uint128": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigUint(128),
                    getGenerator: () => _generateIntBitLength(128, false),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeUint(v, 128),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () =>
                        Dictionary.Values.BigUint(128),
                    getGenerator: () => _generateIntBitLength(128, false),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeUint(v, 128),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as uint256": {
            return [
                constructKeyTypeExistential({
                    getDictionaryKeyType: () => Dictionary.Keys.BigUint(256),
                    getGenerator: () => _generateIntBitLength(256, false),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeUint(v, 256),
                    storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                        builder.writeNumber(v);
                    },
                }),
                constructValueTypeExistential({
                    getDictionaryValueType: () =>
                        Dictionary.Values.BigUint(256),
                    getGenerator: () => _generateIntBitLength(256, false),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeUint(v, 256),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
        case "Int as coins": {
            return [
                undefined,
                constructValueTypeExistential({
                    getDictionaryValueType: () =>
                        Dictionary.Values.BigVarUint(4),
                    getGenerator: () => _generateCoins(),
                    storeInCellBuilder: (v: bigint, builder: Builder) =>
                        builder.storeCoins(v),
                    readOptionalFromTupleReader: (reader: TupleReader) =>
                        reader.readBigNumberOpt() ?? undefined,
                    equals: (o1: bigint | undefined, o2: bigint | undefined) =>
                        o1 === o2,
                }),
            ];
        }
    }
}

function testSubwalletId(seed: string): bigint {
    return BigInt("0x" + sha256_sync("TEST_SEED" + seed).toString("hex"));
}

function _generateAddress(): fc.Arbitrary<Address> {
    return fc.string().map((str) => {
        const subwalletId = testSubwalletId(str);
        const wallet = TreasuryContract.create(0, subwalletId);
        return wallet.address;
    });
}

function _generateCell(): fc.Arbitrary<Cell> {
    return fc.int8Array().map((buf) => {
        return beginCell().storeBuffer(Buffer.from(buf.buffer)).endCell();
    });
}

function _generateIntBitLength(bitLength: number, signed: boolean) {
    const maxUnsigned = (1n << BigInt(bitLength)) - 1n;

    if (signed) {
        const minSigned = -maxUnsigned / 2n - 1n;
        const maxSigned = maxUnsigned / 2n;
        return fc.bigInt(minSigned, maxSigned);
    } else {
        return fc.bigInt(0n, maxUnsigned);
    }
}

function _generateCoins() {
    return fc
        .integer({ min: 0, max: 120 })
        .chain((bitLength) => _generateIntBitLength(bitLength, false));
}

export function generateKeyValuePairs<K, V>(
    keyGenerator: () => fc.Arbitrary<K>,
    valueGenerator: () => fc.Arbitrary<V>,
) {
    return fc.array(fc.tuple(keyGenerator(), valueGenerator()));
}

export function compareDicts<K extends DictionaryKeyTypes, V>(
    dict1: Dictionary<K, V>,
    dict2: Dictionary<K, V>,
    vHandler: ValueTypeHandler<V>,
) {
    return (
        dict1
            .keys()
            .every((key) => vHandler.equals(dict1.get(key), dict2.get(key))) &&
        dict2
            .keys()
            .every((key) => vHandler.equals(dict2.get(key), dict1.get(key)))
    );
}
