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

    async getWholeMap(
        provider: ContractProvider,
        kHandler: TypeHandler,
        vHandler: TypeHandler,
    ) {
        const builder = new TupleBuilder();
        const reader = (await provider.get("wholeMap", builder.build())).stack;
        return Dictionary.loadDirect(
            kHandler.getDictionaryKeyType(),
            vHandler.getDictionaryValueType(),
            reader.readCellOpt(),
        );
    }

    async getGetValue(
        provider: ContractProvider,
        key: any,
        kHandler: TypeHandler,
        vHandler: TypeHandler,
    ) {
        const builder = new TupleBuilder();
        kHandler.storeInTupleBuilder(key, builder);
        const source = (await provider.get("getValue", builder.build())).stack;
        // Transform the null to undefined, since querying dictionaries with "get"
        // will return undefined instead of null.
        const result =
            vHandler.readOptionalFromTupleReader(source) ?? undefined;
        return result;
    }

    async getExists(
        provider: ContractProvider,
        key: any,
        kHandler: TypeHandler,
    ) {
        const builder = new TupleBuilder();
        kHandler.storeInTupleBuilder(key, builder);
        const source = (await provider.get("exists", builder.build())).stack;
        const result = source.readBoolean();
        return result;
    }
}

export function getContractStateInit(contractCode: Buffer): StateInit {
    const data = beginCell().storeUint(0, 1).endCell();
    const code = Cell.fromBoc(contractCode)[0];
    if (typeof code === "undefined") {
        throw new Error("Code cell expected");
    }
    return { code, data };
}

export function createDict<K, V>(
    initialKeyValuePairs: [K, V][],
    kHandler: TypeHandler,
    vHandler: TypeHandler,
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

// All handlers for each possible type
// Unfortunately, we loose type safety when working with dynamically created contracts
// and dictionaries
interface TypeHandler {
    getDictionaryKeyType(): DictionaryKey<any>;
    getDictionaryValueType(): DictionaryValue<any>;
    getGenerator(): fc.Arbitrary<any>;
    storeInCellBuilder(v: any, builder: Builder): void;
    storeInTupleBuilder(v: any, builder: TupleBuilder): void;
    readOptionalFromTupleReader(reader: TupleReader): any;
    equals(o1: any, o2: any): boolean;
    cast(o: any): any;
}

export function getTypeHandler(kvT: keyValueTypes): TypeHandler {
    switch (kvT) {
        case "Int": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigInt(257),
                getDictionaryValueType: () => Dictionary.Values.BigInt(257),
                getGenerator: () => _generateIntBitLength(257, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 257),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Address": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Address(),
                getDictionaryValueType: () => Dictionary.Values.Address(),
                getGenerator: () => _generateAddress(),
                storeInCellBuilder: (v: Address, builder: Builder) =>
                    builder.storeAddress(v),
                storeInTupleBuilder: (v: Address, builder: TupleBuilder) => {
                    builder.writeAddress(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readAddressOpt(),
                equals: (o1: Address, o2: Address) => o1.equals(o2),
                cast: (o: Address) => o,
            };
        }
        case "Bool": {
            return {
                getDictionaryKeyType: () => {
                    throw new Error("Bool is not a valid key type");
                },
                getDictionaryValueType: () => Dictionary.Values.Bool(),
                getGenerator: () => fc.boolean(),
                storeInCellBuilder: (v: boolean, builder: Builder) =>
                    builder.storeBit(v),
                storeInTupleBuilder: (v: boolean, builder: TupleBuilder) => {
                    builder.writeBoolean(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBooleanOpt(),
                equals: (o1: boolean, o2: boolean) => o1 === o2,
                cast: (o: boolean) => o,
            };
        }
        case "Cell": {
            return {
                getDictionaryKeyType: () => {
                    throw new Error("Cell is not a valid key type");
                },
                getDictionaryValueType: () => Dictionary.Values.Cell(),
                getGenerator: () => _generateCell(),
                storeInCellBuilder: (v: Cell, builder: Builder) =>
                    builder.storeRef(v),
                storeInTupleBuilder: (v: Cell, builder: TupleBuilder) => {
                    builder.writeCell(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readCellOpt(),
                equals: (o1: Cell, o2: Cell) => o1.equals(o2),
                cast: (o: Cell) => o,
            };
        }
        case "Int as int8": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Int(8),
                getDictionaryValueType: () => Dictionary.Values.Int(8),
                getGenerator: () => _generateIntBitLength(8, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 8),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => Number(o),
            };
        }
        case "Int as int16": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Int(16),
                getDictionaryValueType: () => Dictionary.Values.Int(16),
                getGenerator: () => _generateIntBitLength(16, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 16),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => Number(o),
            };
        }
        case "Int as int32": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Int(32),
                getDictionaryValueType: () => Dictionary.Values.Int(32),
                getGenerator: () => _generateIntBitLength(32, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 32),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => Number(o),
            };
        }
        case "Int as int64": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigInt(64),
                getDictionaryValueType: () => Dictionary.Values.BigInt(64),
                getGenerator: () => _generateIntBitLength(64, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 64),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as int128": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigInt(128),
                getDictionaryValueType: () => Dictionary.Values.BigInt(128),
                getGenerator: () => _generateIntBitLength(128, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 128),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as int256": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigInt(256),
                getDictionaryValueType: () => Dictionary.Values.BigInt(256),
                getGenerator: () => _generateIntBitLength(256, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 256),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as int257": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigInt(257),
                getDictionaryValueType: () => Dictionary.Values.BigInt(257),
                getGenerator: () => _generateIntBitLength(257, true),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeInt(v, 257),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as uint8": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Uint(8),
                getDictionaryValueType: () => Dictionary.Values.Uint(8),
                getGenerator: () => _generateIntBitLength(8, false),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeUint(v, 8),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => Number(o),
            };
        }
        case "Int as uint16": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Uint(16),
                getDictionaryValueType: () => Dictionary.Values.Uint(16),
                getGenerator: () => _generateIntBitLength(16, false),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeUint(v, 16),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => Number(o),
            };
        }
        case "Int as uint32": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.Uint(32),
                getDictionaryValueType: () => Dictionary.Values.Uint(32),
                getGenerator: () => _generateIntBitLength(32, false),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeUint(v, 32),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => Number(o),
            };
        }
        case "Int as uint64": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigUint(64),
                getDictionaryValueType: () => Dictionary.Values.BigUint(64),
                getGenerator: () => _generateIntBitLength(64, false),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeUint(v, 64),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as uint128": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigUint(128),
                getDictionaryValueType: () => Dictionary.Values.BigUint(128),
                getGenerator: () => _generateIntBitLength(128, false),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeUint(v, 128),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as uint256": {
            return {
                getDictionaryKeyType: () => Dictionary.Keys.BigUint(256),
                getDictionaryValueType: () => Dictionary.Values.BigUint(256),
                getGenerator: () => _generateIntBitLength(256, false),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeUint(v, 256),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
        }
        case "Int as coins": {
            return {
                getDictionaryKeyType: () => {
                    throw new Error("coins is not a valid key type");
                },
                getDictionaryValueType: () => Dictionary.Values.BigVarUint(4),
                getGenerator: () => _generateCoins(),
                storeInCellBuilder: (v: bigint, builder: Builder) =>
                    builder.storeCoins(v),
                storeInTupleBuilder: (v: bigint, builder: TupleBuilder) => {
                    builder.writeNumber(v);
                },
                readOptionalFromTupleReader: (reader: TupleReader) =>
                    reader.readBigNumberOpt(),
                equals: (o1: bigint, o2: bigint) => o1 === o2,
                cast: (o: bigint) => o,
            };
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
    vHandler: TypeHandler,
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
