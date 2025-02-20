import fc from "fast-check";
import { toNano } from "@ton/core";
import type { Dictionary, DictionaryKeyTypes } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { MapTestContract } from "../../contracts/output/map-property-based_MapTestContract";
import type {
    ClearRequest,
    SetKeyValue,
    DeleteKey,
} from "../../contracts/output/map-property-based_MapTestContract";

function generateKeyValuePairs<K, V>(
    keyGenerator: () => fc.Arbitrary<K>,
    valueGenerator: () => fc.Arbitrary<V>,
) {
    return fc.array(fc.tuple(keyGenerator(), valueGenerator()));
}

function compareDicts<K extends DictionaryKeyTypes, V>(
    dict1: Dictionary<K, V>,
    dict2: Dictionary<K, V>,
) {
    return (
        dict1.keys().every((key) => dict1.get(key) === dict2.get(key)) &&
        dict2.keys().every((key) => dict2.get(key) === dict1.get(key))
    );
}

type ContractWithContext = {
    blockchain: Blockchain;
    treasury: SandboxContract<TreasuryContract>;
    contract: SandboxContract<MapTestContract>;
};

function sendMessageToContract(
    contract: ContractWithContext,
    message: SetKeyValue | ClearRequest | DeleteKey | null,
) {
    return contract.contract.send(
        contract.treasury.getSender(),
        { value: toNano("1") },
        message,
    );
}

async function initializeContract(
    contract: ContractWithContext,
    keyValuePairs: [number, number][],
) {
    for await (const [key, value] of keyValuePairs) {
        await sendMessageToContract(contract, {
            $$type: "SetKeyValue",
            key: BigInt(key),
            value: BigInt(value),
        });
    }
    return contract;
}

describe("Map property based tests", () => {
    let contractWithContext: ContractWithContext;

    beforeAll(async () => {
        // Initialize the blockchain and contracts
        const blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        contractWithContext = {
            blockchain,
            treasury: await blockchain.treasury("treasury"),
            contract: blockchain.openContract(await MapTestContract.fromInit()),
        };

        // Fund the contract with some TONs
        await sendMessageToContract(contractWithContext, null);
    });

    it("adds new element in tact's 'map' exactly like in ton's 'Dictionary'", async () => {
        await fc.assert(
            fc
                .asyncProperty(
                    generateKeyValuePairs(fc.integer, fc.integer),
                    fc.integer(),
                    fc.integer(),
                    async (keyValuePairs, testKey, testValue) => {
                        const initializedContract = await initializeContract(
                            contractWithContext,
                            keyValuePairs,
                        );

                        const initialMap =
                            await initializedContract.contract.getWholeMap();
                        initialMap.set(BigInt(testKey), BigInt(testValue));

                        await sendMessageToContract(contractWithContext, {
                            $$type: "SetKeyValue",
                            key: BigInt(testKey),
                            value: BigInt(testValue),
                        });

                        const finalMap =
                            await contractWithContext.contract.getWholeMap();

                        return compareDicts(initialMap, finalMap);
                    },
                )
                .afterEach(async () => {
                    //Clear previous map data for next tests
                    await sendMessageToContract(contractWithContext, {
                        $$type: "ClearRequest",
                    });
                }),
        );
    });

    it("creates empty map", async () => {
        const initializedContract = await initializeContract(
            contractWithContext,
            [],
        );
        const map = await initializedContract.contract.getWholeMap();
        expect(map.keys().length).toBe(0);
    });

    it("gets element from tact 'map' exactly like from ton's 'Dictionary'", async () => {
        await fc.assert(
            fc
                .asyncProperty(
                    generateKeyValuePairs(fc.integer, fc.integer),
                    fc.integer(),
                    async (keyValuePairs, testKey) => {
                        const initializedContract = await initializeContract(
                            contractWithContext,
                            keyValuePairs,
                        );
                        const map =
                            await initializedContract.contract.getWholeMap();

                        expect(
                            await initializedContract.contract.getGetValue(
                                BigInt(testKey),
                            ),
                        ).toBe(map.get(BigInt(testKey)) ?? null);
                    },
                )
                .afterEach(async () => {
                    //Clear previous map data for next tests
                    await sendMessageToContract(contractWithContext, {
                        $$type: "ClearRequest",
                    });
                }),
        );
    });

    it("deletes key from tact's 'map' exactly like from ton's 'Dictionary'", async () => {
        await fc.check(
            fc.asyncProperty(
                generateKeyValuePairs(fc.integer, fc.integer),
                fc.integer(),
                async (keyValuePairs, testKey) => {
                    const initializedContract = await initializeContract(
                        contractWithContext,
                        keyValuePairs,
                    );

                    const initialMap =
                        await initializedContract.contract.getWholeMap();
                    initialMap.delete(BigInt(testKey));

                    await sendMessageToContract(contractWithContext, {
                        $$type: "DeleteKey",
                        key: BigInt(testKey),
                    });

                    const finalMap =
                        await contractWithContext.contract.getWholeMap();

                    return compareDicts(initialMap, finalMap);
                },
            ),
        );
    });

    it("check if element exists in tact's 'map' exactly like in ton's 'Dictionary'", async () => {
        await fc.check(
            fc.asyncProperty(
                generateKeyValuePairs(fc.integer, fc.integer),
                fc.integer(),
                async (keyValuePairs, testKey) => {
                    const initializedContract = await initializeContract(
                        contractWithContext,
                        keyValuePairs,
                    );
                    const map =
                        await initializedContract.contract.getWholeMap();

                    expect(
                        await initializedContract.contract.getExists(
                            BigInt(testKey),
                        ),
                    ).toBe(map.has(BigInt(testKey)));
                },
            ),
        );
    });
});
