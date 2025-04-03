import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import type * as Ast from "@/ast/ast";
import { getAstFactory, type FactoryAst } from "@/ast/ast-helpers";
import { getMakeAst } from "@/ast/generated/make-factory";
import {
    buildModule,
    compareDicts,
    createDict,
    filterGlobalDeclarations,
    generateKeyValuePairs,
    getContractStateInit,
    getExists,
    getGetValue,
    getKeyTypeHandler,
    getValueTypeHandler,
    getWholeMap,
    keyTypes,
    loadCustomStdlibFc,
    parseStandardLibrary,
    ProxyContract,
    valueTypes,
} from "@/test/e2e-emulated/map-property-tests/fuzzing/util";
import type {
    keyType,
    KeyTypeHandler,
    keyValueTypes,
    valueType,
    ValueTypeHandler,
} from "@/test/e2e-emulated/map-property-tests/fuzzing/util";
import { expect } from "expect";
import { beginCell, Cell, toNano } from "@ton/core";
import type { DictionaryKeyTypes } from "@ton/core";
import { findTransaction } from "@ton/test-utils";
import * as fc from "fast-check";

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

type ContractWrapper = {
    moduleItems: Ast.ModuleItem[];
    keyType: keyType;
    valueType: valueType;
    contractName: string;
    messageOpCodes: Map<string, bigint>;
};

type CompiledContractWrapper = {
    boc: Buffer;
    keyType: keyType;
    valueType: valueType;
    contractName: string;
    messageOpCodes: Map<string, bigint>;
};

type ModuleWrapper = {
    module: Ast.Module;
    contractNames: Set<string>;
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
    ): {
        items: Ast.ModuleItem[];
        contractName: string;
        messageOpCodes: Map<string, bigint>;
    } {
        const moduleItems: Ast.ModuleItem[] = [];
        const messageOpCodes: Map<string, bigint> = new Map();

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

            const opCode = getFreshOpCode();
            moduleItems.push(
                mF.makeDummyMessageDecl(
                    mF.makeDummyId("SetKeyValue_" + namePostfix),
                    mF.makeDummyNumber(10, opCode),
                    [keyField, valueField],
                ),
            );

            messageOpCodes.set("SetKeyValue", opCode);
        }

        // Message declaration for DeleteKey
        {
            const keyField = mF.makeDummyFieldDecl(
                mF.makeDummyId("key"),
                kTNode,
                undefined,
                kSNode,
            );

            const opCode = getFreshOpCode();
            moduleItems.push(
                mF.makeDummyMessageDecl(
                    mF.makeDummyId("DeleteKey_" + namePostfix),
                    mF.makeDummyNumber(10, opCode),
                    [keyField],
                ),
            );

            messageOpCodes.set("DeleteKey", opCode);
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

        return { items: moduleItems, contractName, messageOpCodes };
    }

    function createCommonModuleItems(): {
        items: Ast.ModuleItem[];
        messageOpCodes: Map<string, bigint>;
    } {
        const moduleItems: Ast.ModuleItem[] = [];
        const messageOpCodes: Map<string, bigint> = new Map();

        // Message declaration for ClearRequest
        const opCode = getFreshOpCode();
        moduleItems.push(
            mF.makeDummyMessageDecl(
                mF.makeDummyId("ClearRequest"),
                mF.makeDummyNumber(10, opCode),
                [],
            ),
        );
        messageOpCodes.set("ClearRequest", opCode);

        return { items: moduleItems, messageOpCodes };
    }

    function createCompilationModules(
        wrappedContracts: ContractWrapper[],
        commonItems: Ast.ModuleItem[],
        compilationBatchSize: number,
    ): ModuleWrapper[] {
        const modules: ModuleWrapper[] = [];

        let moduleItemAccumulator: Ast.ModuleItem[] = [];
        let contractNamesAccumulator: Set<string> = new Set();

        let counter = 0;

        for (const wrappedContract of wrappedContracts) {
            moduleItemAccumulator.push(...wrappedContract.moduleItems);
            const contractName = wrappedContract.contractName;
            contractNamesAccumulator.add(contractName);
            counter++;

            if (counter >= compilationBatchSize) {
                modules.push({
                    module: mF.makeModule(
                        [],
                        [...moduleItemAccumulator, ...commonItems],
                    ),
                    contractNames: contractNamesAccumulator,
                });
                counter = 0;
                moduleItemAccumulator = [];
                contractNamesAccumulator = new Set();
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
                contractNames: contractNamesAccumulator,
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

async function main() {
    const batchSize = 15;
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
                messageOpCodes: contractData.messageOpCodes,
            });
        }
    }

    // Now group the contracts into batches. Each batch will be a single module
    // for compilation. Attach the common module items into each batch.
    const modulesForCompilation = mF.createCompilationModules(
        contracts,
        commonItems.items,
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
            `Compiling batch with contract names [${[...moduleWrap.contractNames].join(",")}]...`,
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

    const finalCompiledContracts = contracts.map((contract) => {
        const boc = contractCodesAccumulator.get(contract.contractName);
        if (typeof boc === "undefined") {
            throw new Error(
                `Expected contract ${contract.contractName} to have a compiled code`,
            );
        }
        // Attach the message opcodes created by the common items
        const finalMessageOpcodes = new Map(commonItems.messageOpCodes);
        for (const [key, val] of contract.messageOpCodes) {
            finalMessageOpcodes.set(key, val);
        }
        return {
            boc,
            contractName: contract.contractName,
            keyType: contract.keyType,
            valueType: contract.valueType,
            messageOpCodes: finalMessageOpcodes,
        };
    });

    await testCompiledContracts(finalCompiledContracts);
}

async function testCompiledContracts(contracts: CompiledContractWrapper[]) {
    const blockchain = await Blockchain.create();
    const treasury = await blockchain.treasury("treasury");

    for (const contract of contracts) {
        await testCompiledContract(contract, blockchain, treasury);
    }
}

async function testCompiledContract(
    contract: CompiledContractWrapper,
    blockchain: Blockchain,
    treasury: SandboxContract<TreasuryContract>,
) {
    console.log(`Testing contract ${contract.contractName}...`);

    // Some utility functions
    async function sendMessage(message: Cell) {
        return await contractToTest.send(
            treasury.getSender(),
            { value: toNano("1") },
            message,
        );
    }

    function obtainOpCode(messageName: string): bigint {
        const opCode = contract.messageOpCodes.get(messageName);
        if (typeof opCode === "undefined") {
            throw new Error(
                `${messageName} does not have a registered op code`,
            );
        }
        return opCode;
    }

    function prepareSetKeyValueMessage<K extends DictionaryKeyTypes, V>(
        key: K,
        value: V,
        kHandler: KeyTypeHandler<K>,
        vHandler: ValueTypeHandler<V>,
    ): Cell {
        const builder = beginCell();
        builder.storeUint(obtainOpCode("SetKeyValue"), 32);
        kHandler.storeInCellBuilder(key, builder);
        vHandler.storeInCellBuilder(value, builder);
        return builder.endCell();
    }

    function prepareDeleteKeyMessage<K extends DictionaryKeyTypes>(
        key: K,
        kHandler: KeyTypeHandler<K>,
    ): Cell {
        const builder = beginCell();
        builder.storeUint(obtainOpCode("DeleteKey"), 32);
        kHandler.storeInCellBuilder(key, builder);
        return builder.endCell();
    }

    function prepareClearRequestMessage(): Cell {
        const builder = beginCell();
        builder.storeUint(obtainOpCode("ClearRequest"), 32);
        return builder.endCell();
    }

    async function initializeContract<K extends DictionaryKeyTypes, V>(
        keyValuePairs: [K, V][],
        kHandler: KeyTypeHandler<K>,
        vHandler: ValueTypeHandler<V>,
    ) {
        for (const [key, value] of keyValuePairs) {
            const messageCell = prepareSetKeyValueMessage(
                key,
                value,
                kHandler,
                vHandler,
            );
            await sendMessage(messageCell);
        }
    }

    function withClear<Ts>(property: fc.IAsyncPropertyWithHooks<Ts>) {
        return property.afterEach(async () => {
            //Clear map data for next tests
            await sendMessage(prepareClearRequestMessage());
        });
    }

    const contractToTest = blockchain.openContract(
        new ProxyContract(getContractStateInit(contract.boc)),
    );

    // Deploy the contract with an empty message
    const { transactions } = await sendMessage(new Cell());
    expect(
        findTransaction(transactions, {
            from: treasury.address,
            to: contractToTest.address,
            oldStatus: "uninitialized",
            endStatus: "active",
            exitCode: 0,
            actionResultCode: 0,
        }),
    ).toBeDefined();

    // These handlers are "sealed" because their types are existential types.
    const sealedKHandler = getKeyTypeHandler(contract.keyType);
    const sealedVHandler = getValueTypeHandler(contract.valueType);

    // To unpack a variable of existential type, we simply apply it on a function
    // where the argument to the function is the unpacked value.
    await sealedKHandler(async (kHandler) => {
        await sealedVHandler(async (vHandler) => {
            // Check that the contract has an initial empty map
            expect(
                (await getWholeMap(contractToTest, kHandler, vHandler)).size,
            ).toBe(0);

            console.log("Checking 'set' function...");
            await checkSetFunction(kHandler, vHandler);

            console.log("Checking 'get' function...");
            await checkGetFunction(kHandler, vHandler);

            console.log("Checking 'del' function...");
            await checkDelFunction(kHandler, vHandler);

            console.log("Checking 'exists' function...");
            await checkExistsFunction(kHandler, vHandler);
        });
    });

    // Test: adds new element in tact's 'map' exactly like in ton's 'Dictionary'
    async function checkSetFunction<K extends DictionaryKeyTypes, V>(
        kHandler: KeyTypeHandler<K>,
        vHandler: ValueTypeHandler<V>,
    ) {
        await fc.assert(
            withClear(
                fc.asyncProperty(
                    generateKeyValuePairs(
                        kHandler.getGenerator,
                        vHandler.getGenerator,
                    ),
                    kHandler.getGenerator(),
                    vHandler.getGenerator(),
                    async (keyValuePairs, testKey, testValue) => {
                        await initializeContract(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        // This is an external dict that emulates what the contract is doing
                        const externalDict = createDict(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        const initialMap = await getWholeMap(
                            contractToTest,
                            kHandler,
                            vHandler,
                        );

                        initialMap.set(testKey, testValue);
                        externalDict.set(testKey, testValue);

                        await sendMessage(
                            prepareSetKeyValueMessage(
                                testKey,
                                testValue,
                                kHandler,
                                vHandler,
                            ),
                        );

                        const finalMap = await getWholeMap(
                            contractToTest,
                            kHandler,
                            vHandler,
                        );

                        return (
                            compareDicts(initialMap, finalMap, vHandler) &&
                            compareDicts(finalMap, externalDict, vHandler)
                        );
                    },
                ),
            ),
        );
    }

    // Test: Gets element from tact 'map' exactly like from ton's 'Dictionary'",
    async function checkGetFunction<K extends DictionaryKeyTypes, V>(
        kHandler: KeyTypeHandler<K>,
        vHandler: ValueTypeHandler<V>,
    ) {
        await fc.assert(
            withClear(
                fc.asyncProperty(
                    generateKeyValuePairs(
                        kHandler.getGenerator,
                        vHandler.getGenerator,
                    ),
                    kHandler.getGenerator(),
                    async (keyValuePairs, testKey) => {
                        await initializeContract(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        // This is an external dict that emulates what the contract is doing
                        const externalDict = createDict(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        const map = await getWholeMap(
                            contractToTest,
                            kHandler,
                            vHandler,
                        );

                        const val = await getGetValue(
                            contractToTest,
                            testKey,
                            kHandler,
                            vHandler,
                        );

                        const mapVal = map.get(testKey);
                        const externalVal = externalDict.get(testKey);

                        expect(vHandler.equals(val, mapVal)).toBe(true);

                        expect(vHandler.equals(val, externalVal)).toBe(true);
                    },
                ),
            ),
        );
    }

    // Test: Deletes key from tact's 'map' exactly like from ton's 'Dictionary'
    async function checkDelFunction<K extends DictionaryKeyTypes, V>(
        kHandler: KeyTypeHandler<K>,
        vHandler: ValueTypeHandler<V>,
    ) {
        await fc.assert(
            withClear(
                fc.asyncProperty(
                    generateKeyValuePairs(
                        kHandler.getGenerator,
                        vHandler.getGenerator,
                    ),
                    kHandler.getGenerator(),
                    async (keyValuePairs, testKey) => {
                        await initializeContract(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        // This is an external dict that emulates what the contract is doing
                        const externalDict = createDict(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        const initialMap = await getWholeMap(
                            contractToTest,
                            kHandler,
                            vHandler,
                        );

                        initialMap.delete(testKey);
                        externalDict.delete(testKey);

                        await sendMessage(
                            prepareDeleteKeyMessage(testKey, kHandler),
                        );

                        const finalMap = await getWholeMap(
                            contractToTest,
                            kHandler,
                            vHandler,
                        );

                        return (
                            compareDicts(initialMap, finalMap, vHandler) &&
                            compareDicts(finalMap, externalDict, vHandler)
                        );
                    },
                ),
            ),
        );
    }

    // Test: Check if element exists in tact's 'map' exactly like in ton's 'Dictionary'
    async function checkExistsFunction<K extends DictionaryKeyTypes, V>(
        kHandler: KeyTypeHandler<K>,
        vHandler: ValueTypeHandler<V>,
    ) {
        await fc.assert(
            withClear(
                fc.asyncProperty(
                    generateKeyValuePairs(
                        kHandler.getGenerator,
                        vHandler.getGenerator,
                    ),
                    kHandler.getGenerator(),
                    async (keyValuePairs, testKey) => {
                        await initializeContract(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        // This is an external dict that emulates what the contract is doing
                        const externalDict = createDict(
                            keyValuePairs,
                            kHandler,
                            vHandler,
                        );

                        const map = await getWholeMap(
                            contractToTest,
                            kHandler,
                            vHandler,
                        );

                        expect(
                            await getExists(contractToTest, testKey, kHandler),
                        ).toBe(map.has(testKey) && externalDict.has(testKey));
                    },
                ),
            ),
        );
    }
}

void main();
