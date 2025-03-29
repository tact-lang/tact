import type * as Ast from "../../../../ast/ast";
import { getAstFactory, type FactoryAst } from "../../../../ast/ast-helpers";
import { getMakeAst } from "../../../../ast/generated/make-factory";
import {
    buildModule,
    filterGlobalDeclarations,
    loadCustomStdlibFc,
    parseStandardLibrary,
} from "./util";

const keyTypes = [
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

const valueTypes = [
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

type keyType = (typeof keyTypes)[number];
type valueType = (typeof valueTypes)[number];
type keyValueTypes = keyType | valueType;

function splitTypeAndSerialization(
    type: keyValueTypes,
): [string, string | undefined] {
    const components = type.split(" as ");
    const typePart = components[0];
    if (typeof typePart === "undefined") {
        throw new Error(`Expected a type in ${type}`);
    }
    return [typePart, components[1]];
}

/*
const typeGenerators: Record<keyValueTypes, string> = {
    Int: "fc.bigInt",
    Address: "_generateAddressLocal",
    Bool: "fc.boolean",
    Cell: "_generateCell",
    "Int as uint8": "(() => _generateIntBitLength(8, false))",
    "Int as uint16": "(() => _generateIntBitLength(16, false))",
    "Int as uint32": "(() => _generateIntBitLength(32, false))",
    "Int as uint64": "(() => _generateIntBitLength(64, false))",
    "Int as uint128": "(() => _generateIntBitLength(128, false))",
    "Int as uint256": "(() => _generateIntBitLength(256, false))",
    "Int as int8": "(() => _generateIntBitLength(8))",
    "Int as int16": "(() => _generateIntBitLength(16))",
    "Int as int32": "(() => _generateIntBitLength(32))",
    "Int as int64": "(() => _generateIntBitLength(64))",
    "Int as int128": "(() => _generateIntBitLength(128))",
    "Int as int256": "(() => _generateIntBitLength(256))",
    "Int as int257": "(() => _generateIntBitLength(257))",
    "Int as coins": "_generateCoins",
};

const smallSerialization: Record<keyValueTypes, boolean> = {
    Int: false,
    Address: false,
    Bool: false,
    Cell: false,
    "Int as uint8": true,
    "Int as uint16": true,
    "Int as uint32": true,
    "Int as uint64": false,
    "Int as uint128": false,
    "Int as uint256": false,
    "Int as int8": true,
    "Int as int16": true,
    "Int as int32": true,
    "Int as int64": false,
    "Int as int128": false,
    "Int as int256": false,
    "Int as int257": false,
    "Int as coins": false,
};

function getCast(type: keyValueTypes): string {
    return smallSerialization[type] ? "Number" : "";
}

const tsTypeMapping: Record<keyValueTypes, string> = {
    Int: "bigint",
    Address: "Address",
    Bool: "boolean",
    Cell: "Cell",
    "Int as uint8": "bigint",
    "Int as uint16": "bigint",
    "Int as uint32": "bigint",
    "Int as uint64": "bigint",
    "Int as uint128": "bigint",
    "Int as uint256": "bigint",
    "Int as int8": "bigint",
    "Int as int16": "bigint",
    "Int as int32": "bigint",
    "Int as int64": "bigint",
    "Int as int128": "bigint",
    "Int as int256": "bigint",
    "Int as int257": "bigint",
    "Int as coins": "bigint",
};*/

type ContractWrapper = {
    moduleItems: Ast.ModuleItem[];
    keyType: keyType;
    valueType: valueType;
    contractName: string;
};

type ModuleWrapper = {
    module: Ast.Module;
    contracts: Map<string, [keyType, valueType]>;
};

function getModuleItemsFactory(astF: FactoryAst) {
    let opCodeCounter = 50n;
    const mF = getMakeAst(astF);
    const mapFieldName = "mapUnderTest";

    function getFreshOpCode(): bigint {
        return opCodeCounter++;
    }

    function createContract(
        keyT: keyType,
        valT: valueType,
    ): { items: Ast.ModuleItem[]; contractName: string } {
        const moduleItems: Ast.ModuleItem[] = [];

        const namePostfix =
            keyT.replaceAll(" ", "_") + valT.replaceAll(" ", "_");
        const contractName = "C_" + namePostfix;
        const [kT, kS] = splitTypeAndSerialization(keyT);
        const [vT, vS] = splitTypeAndSerialization(valT);
        const kTNode = mF.makeDummyTypeId(kT);
        const vTNode = mF.makeDummyTypeId(vT);
        const kSNode =
            typeof kS !== "undefined" ? mF.makeDummyId(kS) : undefined;
        const vSNode =
            typeof vS !== "undefined" ? mF.makeDummyId(vS) : undefined;

        // Message declaration for SetKeyValue
        {
            const keyField = mF.makeDummyFieldDecl(
                mF.makeDummyId("key"),
                kTNode,
                undefined,
                kSNode,
            );
            const valueField = mF.makeDummyFieldDecl(
                mF.makeDummyId("value"),
                vTNode,
                undefined,
                vSNode,
            );

            moduleItems.push(
                mF.makeDummyMessageDecl(
                    mF.makeDummyId("SetKeyValue_" + namePostfix),
                    mF.makeDummyNumber(10, getFreshOpCode()),
                    [keyField, valueField],
                ),
            );
        }

        // Message declaration for DeleteKey
        {
            const keyField = mF.makeDummyFieldDecl(
                mF.makeDummyId("key"),
                kTNode,
                undefined,
                kSNode,
            );
            moduleItems.push(
                mF.makeDummyMessageDecl(
                    mF.makeDummyId("DeleteKey_" + namePostfix),
                    mF.makeDummyNumber(10, getFreshOpCode()),
                    [keyField],
                ),
            );
        }

        // Contract declaration
        {
            const decls: Ast.ContractDeclaration[] = [];

            // Map field
            decls.push(
                mF.makeDummyFieldDecl(
                    mF.makeDummyId(mapFieldName),
                    mF.makeDummyMapType(kTNode, kSNode, vTNode, vSNode),
                    undefined,
                    undefined,
                ),
            );

            // init function
            {
                const body = mF.makeDummyStatementAssign(
                    mF.makeDummyFieldAccess(
                        mF.makeDummyId("self"),
                        mF.makeDummyId(mapFieldName),
                    ),
                    mF.makeDummyStaticCall(mF.makeDummyId("emptyMap"), []),
                );
                decls.push(mF.makeDummyContractInit([], [body]));
            }

            // wholeMap getter
            {
                const body = mF.makeDummyStatementReturn(
                    mF.makeDummyFieldAccess(
                        mF.makeDummyId("self"),
                        mF.makeDummyId(mapFieldName),
                    ),
                );
                decls.push(
                    mF.makeDummyFunctionDef(
                        [mF.makeDummyFunctionAttributeGet(undefined)],
                        mF.makeDummyId("wholeMap"),
                        mF.makeDummyMapType(kTNode, kSNode, vTNode, vSNode),
                        [],
                        [body],
                    ),
                );
            }

            // getValue getter
            {
                const body = mF.makeDummyStatementReturn(
                    mF.makeDummyMethodCall(
                        mF.makeDummyFieldAccess(
                            mF.makeDummyId("self"),
                            mF.makeDummyId(mapFieldName),
                        ),
                        mF.makeDummyId("get"),
                        [mF.makeDummyId("key")],
                    ),
                );
                decls.push(
                    mF.makeDummyFunctionDef(
                        [mF.makeDummyFunctionAttributeGet(undefined)],
                        mF.makeDummyId("getValue"),
                        mF.makeDummyOptionalType(vTNode),
                        [
                            mF.makeDummyTypedParameter(
                                mF.makeDummyId("key"),
                                kTNode,
                            ),
                        ],
                        [body],
                    ),
                );
            }

            // exists getter
            {
                const body = mF.makeDummyStatementReturn(
                    mF.makeDummyMethodCall(
                        mF.makeDummyFieldAccess(
                            mF.makeDummyId("self"),
                            mF.makeDummyId(mapFieldName),
                        ),
                        mF.makeDummyId("exists"),
                        [mF.makeDummyId("key")],
                    ),
                );
                decls.push(
                    mF.makeDummyFunctionDef(
                        [mF.makeDummyFunctionAttributeGet(undefined)],
                        mF.makeDummyId("exists"),
                        mF.makeDummyTypeId("Bool"),
                        [
                            mF.makeDummyTypedParameter(
                                mF.makeDummyId("key"),
                                kTNode,
                            ),
                        ],
                        [body],
                    ),
                );
            }

            // Empty receiver
            decls.push(
                mF.makeDummyReceiver(
                    mF.makeDummyReceiverInternal(mF.makeReceiverFallback()),
                    [],
                ),
            );

            // ClearRequest receiver
            {
                const body = mF.makeDummyStatementAssign(
                    mF.makeDummyFieldAccess(
                        mF.makeDummyId("self"),
                        mF.makeDummyId(mapFieldName),
                    ),
                    mF.makeDummyStaticCall(mF.makeDummyId("emptyMap"), []),
                );
                decls.push(
                    mF.makeDummyReceiver(
                        mF.makeDummyReceiverInternal(
                            mF.makeReceiverSimple(
                                mF.makeDummyTypedParameter(
                                    mF.makeDummyId("_"),
                                    mF.makeDummyTypeId("ClearRequest"),
                                ),
                            ),
                        ),
                        [body],
                    ),
                );
            }

            // SetKeyValue receiver
            {
                const body = mF.makeDummyStatementExpression(
                    mF.makeDummyMethodCall(
                        mF.makeDummyFieldAccess(
                            mF.makeDummyId("self"),
                            mF.makeDummyId(mapFieldName),
                        ),
                        mF.makeDummyId("set"),
                        [
                            mF.makeDummyFieldAccess(
                                mF.makeDummyId("data"),
                                mF.makeDummyId("key"),
                            ),
                            mF.makeDummyFieldAccess(
                                mF.makeDummyId("data"),
                                mF.makeDummyId("value"),
                            ),
                        ],
                    ),
                );
                decls.push(
                    mF.makeDummyReceiver(
                        mF.makeDummyReceiverInternal(
                            mF.makeReceiverSimple(
                                mF.makeDummyTypedParameter(
                                    mF.makeDummyId("data"),
                                    mF.makeDummyTypeId(
                                        "SetKeyValue_" + namePostfix,
                                    ),
                                ),
                            ),
                        ),
                        [body],
                    ),
                );
            }

            // DeleteKey receiver
            {
                const body = mF.makeDummyStatementExpression(
                    mF.makeDummyMethodCall(
                        mF.makeDummyFieldAccess(
                            mF.makeDummyId("self"),
                            mF.makeDummyId(mapFieldName),
                        ),
                        mF.makeDummyId("del"),
                        [
                            mF.makeDummyFieldAccess(
                                mF.makeDummyId("data"),
                                mF.makeDummyId("key"),
                            ),
                        ],
                    ),
                );
                decls.push(
                    mF.makeDummyReceiver(
                        mF.makeDummyReceiverInternal(
                            mF.makeReceiverSimple(
                                mF.makeDummyTypedParameter(
                                    mF.makeDummyId("data"),
                                    mF.makeDummyTypeId(
                                        "DeleteKey_" + namePostfix,
                                    ),
                                ),
                            ),
                        ),
                        [body],
                    ),
                );
            }

            moduleItems.push(
                mF.makeDummyContract(
                    mF.makeDummyId(contractName),
                    [],
                    [],
                    undefined,
                    decls,
                ),
            );
        }

        return { items: moduleItems, contractName };
    }

    function createCommonModuleItems(): Ast.ModuleItem[] {
        const moduleItems: Ast.ModuleItem[] = [];

        // Message declaration for ClearRequest
        moduleItems.push(
            mF.makeDummyMessageDecl(
                mF.makeDummyId("ClearRequest"),
                mF.makeDummyNumber(10, getFreshOpCode()),
                [],
            ),
        );

        return moduleItems;
    }

    function createCompilationModules(
        wrappedContracts: ContractWrapper[],
        commonItems: Ast.ModuleItem[],
        compilationBatchSize: number,
    ): ModuleWrapper[] {
        const modules: ModuleWrapper[] = [];

        let moduleItemAccumulator: Ast.ModuleItem[] = [];
        let contractNamesAccumulator: Map<string, [keyType, valueType]> =
            new Map();

        let counter = 0;

        for (const wrappedContract of wrappedContracts) {
            moduleItemAccumulator.push(...wrappedContract.moduleItems);
            const contractName = wrappedContract.contractName;
            contractNamesAccumulator.set(contractName, [
                wrappedContract.keyType,
                wrappedContract.valueType,
            ]);
            counter++;

            if (counter >= compilationBatchSize) {
                modules.push({
                    module: mF.makeModule(
                        [],
                        [...moduleItemAccumulator, ...commonItems],
                    ),
                    contracts: contractNamesAccumulator,
                });
                counter = 0;
                moduleItemAccumulator = [];
                contractNamesAccumulator = new Map();
            }
        }

        // if there are elements in the accumulators, it means that the last group
        // did not fill completely, we need to create a module with the leftovers
        if (moduleItemAccumulator.length > 0) {
            modules.push({
                module: mF.makeModule(
                    [],
                    [...moduleItemAccumulator, ...commonItems],
                ),
                contracts: contractNamesAccumulator,
            });
        }

        return modules;
    }

    return {
        createContract,
        createCommonModuleItems,
        createCompilationModules,
    };
}

const main = async () => {
    const batchSize = 20;
    const contracts: ContractWrapper[] = [];
    const astF = getAstFactory();
    const mF = getModuleItemsFactory(astF);

    // Create common module items
    const commonItems = mF.createCommonModuleItems();

    // Generate specific contract for each type combination
    for (const keyType of keyTypes) {
        for (const valueType of valueTypes) {
            const contractData = mF.createContract(keyType, valueType);
            contracts.push({
                moduleItems: contractData.items,
                keyType,
                valueType,
                contractName: contractData.contractName,
            });
        }
    }

    // Now group the contracts into batches. Each batch will be a single module
    // for compilation. Attach the common module items into each batch.
    const modulesForCompilation = mF.createCompilationModules(
        contracts,
        commonItems,
        batchSize,
    );

    console.log(
        `There are ${contracts.length} contracts, grouped into ${modulesForCompilation.length} compilation batches`,
    );

    // Parse the stdlib and filter it with the minimal definitions we need
    const stdlibModule = filterGlobalDeclarations(
        parseStandardLibrary(astF),
        getMakeAst(astF),
        new Set([
            "Int",
            "Bool",
            "Address",
            "Cell",
            "Context",
            "Slice",
            //"Builder",
            //"String",
            "StateInit",
            "SendParameters",
            "BaseTrait",
            "SendDefaultMode",
            "SendRemainingValue",
            "SendIgnoreErrors",
            "SendRemainingBalance",
            "ReserveExact",
            "sender",
            "context",
            "myBalance",
            "nativeReserve",
            //"contractAddress",
            //"contractAddressExt",
            //"storeUint",
            //"storeInt",
            //"contractHash",
            //"newAddress",
            //"beginCell",
            //"endCell",
            "send",
            //"asSlice",
            //"asAddressUnsafe",
            //"beginParse",
        ]),
    );

    const customStdlibFc = loadCustomStdlibFc();

    // Create the custom stdlib, with the loaded custom FunC stdlib
    const customStdlib = {
        modules: [stdlibModule],
        stdlib_fc: customStdlibFc.stdlib_fc,
        stdlib_ex_fc: customStdlibFc.stdlib_ex_fc,
    };

    const contractCodesAccumulator: Map<string, Buffer> = new Map();

    for (const moduleWrap of modulesForCompilation) {
        console.log(
            `Compiling batch with contract names [${[...moduleWrap.contracts.keys()].join(",")}]...`,
        );

        const contractCodes = await buildModule(
            astF,
            moduleWrap.module,
            customStdlib,
            true,
        );

        for (const [key, value] of contractCodes) {
            contractCodesAccumulator.set(key, value);
        }
    }
};

void main();
