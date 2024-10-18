import { randomAddress } from "../utils/randomAddress";
import {
    MapTestContract,
    SomeStruct,
} from "./contracts/output/maps_MapTestContract";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { beginCell, toNano } from "@ton/core";
import { ComputeError } from "@ton/core";
import "@ton/test-utils";

function strEq(a: SomeStruct | null, b: SomeStruct | null) {
    if (a === null || b === null) {
        return a === b;
    }
    return a.value === b.value;
}

describe("map", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<MapTestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await MapTestContract.fromInit());
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
    });

    it("should implement maps correctly", async () => {
        jest.setTimeout(2 * 60000);
        try {
            // Initial state
            expect((await contract.getIntMap1()).size).toBe(0);
            expect(await contract.getIntMap1IsEmpty()).toBe(true);
            expect((await contract.getIntMap2()).size).toBe(0);
            expect((await contract.getIntMap3()).size).toBe(0);
            expect((await contract.getIntMap4()).size).toBe(0);
            expect((await contract.getIntMap5()).size).toBe(0);
            expect((await contract.getIntMap6_1()).size).toBe(0);
            expect((await contract.getIntMap6_2()).size).toBe(0);
            expect((await contract.getIntMap6_3()).size).toBe(0);
            expect((await contract.getIntMap6_4()).size).toBe(0);
            expect((await contract.getIntMap6_5()).size).toBe(0);
            expect((await contract.getIntMap6_6()).size).toBe(0);
            expect((await contract.getIntMap6_7()).size).toBe(0);
            expect((await contract.getIntMap7_1()).size).toBe(0);
            expect((await contract.getIntMap7_2()).size).toBe(0);
            expect((await contract.getIntMap7_3()).size).toBe(0);
            expect((await contract.getIntMap7_4()).size).toBe(0);
            expect((await contract.getIntMap7_5()).size).toBe(0);
            expect((await contract.getIntMap7_6()).size).toBe(0);
            expect((await contract.getIntMap8_1()).size).toBe(0);
            expect((await contract.getIntMap8_2()).size).toBe(0);
            expect((await contract.getIntMap8_3()).size).toBe(0);
            expect((await contract.getIntMap8_4()).size).toBe(0);
            expect((await contract.getIntMap8_5()).size).toBe(0);
            expect((await contract.getIntMap8_6()).size).toBe(0);
            expect((await contract.getIntMap8_7()).size).toBe(0);
            expect((await contract.getIntMap9_1()).size).toBe(0);
            expect((await contract.getIntMap9_2()).size).toBe(0);
            expect((await contract.getIntMap9_3()).size).toBe(0);
            expect((await contract.getIntMap9_4()).size).toBe(0);
            expect((await contract.getIntMap9_5()).size).toBe(0);
            expect((await contract.getIntMap9_6()).size).toBe(0);
            expect((await contract.getIntMap10_1()).size).toBe(0);
            expect((await contract.getIntMap10_2()).size).toBe(0);
            expect((await contract.getIntMap10_3()).size).toBe(0);
            expect((await contract.getIntMap10_4()).size).toBe(0);
            expect((await contract.getAddrMap1()).size).toBe(0);
            expect((await contract.getAddrMap2()).size).toBe(0);
            expect((await contract.getAddrMap3()).size).toBe(0);
            expect((await contract.getAddrMap4()).size).toBe(0);
            expect((await contract.getAddrMap6_1()).size).toBe(0);
            expect((await contract.getAddrMap6_2()).size).toBe(0);
            expect((await contract.getAddrMap6_3()).size).toBe(0);
            expect((await contract.getAddrMap6_4()).size).toBe(0);
            expect((await contract.getAddrMap6_5()).size).toBe(0);
            expect((await contract.getAddrMap6_6()).size).toBe(0);
            expect((await contract.getAddrMap6_7()).size).toBe(0);
            expect((await contract.getAddrMap7_1()).size).toBe(0);
            expect((await contract.getAddrMap7_2()).size).toBe(0);
            expect((await contract.getAddrMap7_3()).size).toBe(0);
            expect((await contract.getAddrMap7_4()).size).toBe(0);
            expect((await contract.getAddrMap7_5()).size).toBe(0);
            expect((await contract.getAddrMap7_6()).size).toBe(0);

            // Keys for test
            const keys: bigint[] = [];
            keys.push(1n);
            keys.push(0n);
            keys.push(-1n);
            keys.push(10102312312312312312312n);
            keys.push(-10102312312312312312312n);
            for (const k of keys) {
                // Check keys to be empty
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();

                // Set keys
                const valueInt = k * 10n;
                const valueBool = k < 0n;
                const addr = randomAddress(0, "addr-" + k.toString(10));
                const valueCell = beginCell().storeUint(123123, 128).endCell();
                const valueStruct: SomeStruct = {
                    $$type: "SomeStruct",
                    value: 10012312n,
                };
                const valueAddr = randomAddress(0, "value-" + k.toString(10));
                const keySmall = k % 100n;
                const keySmallAbs = (k > 0 ? k : -k) % 100n;
                const valueSmall = k % 100n;
                const valueSmallAbs = (k > 0 ? k : -k) % 100n;

                // Send set transactions
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap1", key: k, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap2", key: k, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap3", key: k, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap4", key: k, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap5", key: k, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap6", key: keySmall, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap7",
                        key: keySmallAbs,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap8", key: k, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap9", key: k, value: valueSmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap1", key: addr, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap2", key: addr, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap3", key: addr, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap4", key: addr, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap5", key: addr, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap6", key: addr, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap7", key: addr, value: valueSmallAbs },
                );

                expect(await contract.getIntMap1Value(k)).toBe(valueInt);
                expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
                expect(
                    (await contract.getIntMap3Value(k))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq((await contract.getIntMap4Value(k))!, valueStruct),
                ).toBe(true);
                expect(
                    (await contract.getIntMap5Value(k))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_2Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_3Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_4Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_5Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_6Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_7Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap9_1Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_2Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_3Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_4Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_5Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_6Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getIntMap10Value(keySmall, valueInt),
                ).toBe(valueInt * 7n);
                expect(
                    await contract.getIntMap11Value(keySmallAbs, valueInt),
                ).toBe(valueInt * 6n);
                expect(await contract.getIntMap12Value(k, valueSmall)).toBe(
                    valueSmall * 7n,
                );
                expect(await contract.getIntMap13Value(k, valueSmallAbs)).toBe(
                    valueSmallAbs * 7n,
                );
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(await contract.getAddrMap1Value(addr)).toBe(valueInt);
                expect((await contract.getAddrMap2Value(addr))!).toBe(
                    valueBool,
                );
                expect(
                    (await contract.getAddrMap3Value(addr))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq(
                        (await contract.getAddrMap4Value(addr))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    (await contract.getAddrMap5Value(addr))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getAddrMap6_1Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_2Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_3Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_4Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_5Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_6Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_7Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap7_1Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_2Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_3Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_4Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_5Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_6Value(addr)).toBe(
                    valueSmallAbs,
                );

                // Sizes
                expect((await contract.getIntMap1()).size).toBe(1);
                expect((await contract.getIntMap2()).size).toBe(1);
                expect((await contract.getIntMap3()).size).toBe(1);
                expect((await contract.getIntMap4()).size).toBe(1);
                expect((await contract.getIntMap5()).size).toBe(1);
                expect((await contract.getIntMap6_1()).size).toBe(1);
                expect((await contract.getIntMap6_2()).size).toBe(1);
                expect((await contract.getIntMap6_3()).size).toBe(1);
                expect((await contract.getIntMap6_4()).size).toBe(1);
                expect((await contract.getIntMap6_5()).size).toBe(1);
                expect((await contract.getIntMap6_6()).size).toBe(1);
                expect((await contract.getIntMap6_7()).size).toBe(1);
                expect((await contract.getIntMap7_1()).size).toBe(1);
                expect((await contract.getIntMap7_2()).size).toBe(1);
                expect((await contract.getIntMap7_3()).size).toBe(1);
                expect((await contract.getIntMap7_4()).size).toBe(1);
                expect((await contract.getIntMap7_5()).size).toBe(1);
                expect((await contract.getIntMap7_6()).size).toBe(1);
                expect((await contract.getIntMap8_1()).size).toBe(1);
                expect((await contract.getIntMap8_2()).size).toBe(1);
                expect((await contract.getIntMap8_3()).size).toBe(1);
                expect((await contract.getIntMap8_4()).size).toBe(1);
                expect((await contract.getIntMap8_5()).size).toBe(1);
                expect((await contract.getIntMap8_6()).size).toBe(1);
                expect((await contract.getIntMap8_7()).size).toBe(1);
                expect((await contract.getIntMap9_1()).size).toBe(1);
                expect((await contract.getIntMap9_2()).size).toBe(1);
                expect((await contract.getIntMap9_3()).size).toBe(1);
                expect((await contract.getIntMap9_4()).size).toBe(1);
                expect((await contract.getIntMap9_5()).size).toBe(1);
                expect((await contract.getIntMap9_6()).size).toBe(1);
                expect((await contract.getIntMap10_1()).size).toBe(1);
                expect((await contract.getIntMap10_2()).size).toBe(1);
                expect((await contract.getIntMap10_3()).size).toBe(1);
                expect((await contract.getIntMap10_4()).size).toBe(1);
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Clear keys
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap1", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap2", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap3", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap4", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap5", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap6", key: keySmall, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap7", key: keySmallAbs, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap8", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap9", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap10", key: keySmallAbs, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap1", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap2", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap3", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap4", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap5", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap6", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap7", key: addr, value: null },
                );

                // Check value cleared
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();
                expect(await contract.getIntMap5Value(k)).toBeNull();
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(null);
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(null);
                expect(await contract.getIntMap8_2Value(k)).toBe(null);
                expect(await contract.getIntMap8_3Value(k)).toBe(null);
                expect(await contract.getIntMap8_4Value(k)).toBe(null);
                expect(await contract.getIntMap8_5Value(k)).toBe(null);
                expect(await contract.getIntMap8_6Value(k)).toBe(null);
                expect(await contract.getIntMap8_7Value(k)).toBe(null);
                expect(await contract.getIntMap9_1Value(k)).toBe(null);
                expect(await contract.getIntMap9_2Value(k)).toBe(null);
                expect(await contract.getIntMap9_3Value(k)).toBe(null);
                expect(await contract.getIntMap9_4Value(k)).toBe(null);
                expect(await contract.getIntMap9_5Value(k)).toBe(null);
                expect(await contract.getIntMap9_6Value(k)).toBe(null);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1Value(addr)).toBeNull();
                expect(await contract.getAddrMap2Value(addr)).toBeNull();
                expect(await contract.getAddrMap3Value(addr)).toBeNull();
                expect(await contract.getAddrMap4Value(addr)).toBeNull();
                expect(await contract.getAddrMap5Value(addr)).toBeNull();
                expect(await contract.getAddrMap6_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_6Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_7Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_6Value(addr)).toBe(null);
            }

            // Test isEmpty

            expect(await contract.getIntMap1IsEmpty()).toBe(true);

            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap1", key: 1n, value: 1n },
            );

            expect(await contract.getIntMap1IsEmpty()).toBe(false);

            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap1", key: 1n, value: null },
            );

            expect(await contract.getIntMap1IsEmpty()).toBe(true);

            await expect(contract.getCheckNullReference()).rejects.toThrow(
                "Unable to execute get method. Got exit_code: 128",
            );

            const result = await contract.send(
                treasure.getSender(),
                {
                    value: toNano(1),
                },
                { $$type: "CheckNullReference" },
            );
            expect(result.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                success: false,
                exitCode: 128,
            });
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.logs) {
                    console.warn(e.logs);
                }
            }
            throw e;
        }
    });

    it("should implement key deletion correctly", async () => {
        jest.setTimeout(2 * 60000);
        try {
            // Initial state
            expect((await contract.getIntMap1()).size).toBe(0);
            expect((await contract.getIntMap2()).size).toBe(0);
            expect((await contract.getIntMap3()).size).toBe(0);
            expect((await contract.getIntMap4()).size).toBe(0);
            expect((await contract.getIntMap5()).size).toBe(0);
            expect((await contract.getIntMap6_1()).size).toBe(0);
            expect((await contract.getIntMap6_2()).size).toBe(0);
            expect((await contract.getIntMap6_3()).size).toBe(0);
            expect((await contract.getIntMap6_4()).size).toBe(0);
            expect((await contract.getIntMap6_5()).size).toBe(0);
            expect((await contract.getIntMap6_6()).size).toBe(0);
            expect((await contract.getIntMap6_7()).size).toBe(0);
            expect((await contract.getIntMap7_1()).size).toBe(0);
            expect((await contract.getIntMap7_2()).size).toBe(0);
            expect((await contract.getIntMap7_3()).size).toBe(0);
            expect((await contract.getIntMap7_4()).size).toBe(0);
            expect((await contract.getIntMap7_5()).size).toBe(0);
            expect((await contract.getIntMap7_6()).size).toBe(0);
            expect((await contract.getIntMap8_1()).size).toBe(0);
            expect((await contract.getIntMap8_2()).size).toBe(0);
            expect((await contract.getIntMap8_3()).size).toBe(0);
            expect((await contract.getIntMap8_4()).size).toBe(0);
            expect((await contract.getIntMap8_5()).size).toBe(0);
            expect((await contract.getIntMap8_6()).size).toBe(0);
            expect((await contract.getIntMap8_7()).size).toBe(0);
            expect((await contract.getIntMap9_1()).size).toBe(0);
            expect((await contract.getIntMap9_2()).size).toBe(0);
            expect((await contract.getIntMap9_3()).size).toBe(0);
            expect((await contract.getIntMap9_4()).size).toBe(0);
            expect((await contract.getIntMap9_5()).size).toBe(0);
            expect((await contract.getIntMap9_6()).size).toBe(0);
            expect((await contract.getIntMap10_1()).size).toBe(0);
            expect((await contract.getIntMap10_2()).size).toBe(0);
            expect((await contract.getIntMap10_3()).size).toBe(0);
            expect((await contract.getIntMap10_4()).size).toBe(0);
            expect((await contract.getAddrMap1()).size).toBe(0);
            expect((await contract.getAddrMap2()).size).toBe(0);
            expect((await contract.getAddrMap3()).size).toBe(0);
            expect((await contract.getAddrMap4()).size).toBe(0);
            expect((await contract.getAddrMap6_1()).size).toBe(0);
            expect((await contract.getAddrMap6_2()).size).toBe(0);
            expect((await contract.getAddrMap6_3()).size).toBe(0);
            expect((await contract.getAddrMap6_4()).size).toBe(0);
            expect((await contract.getAddrMap6_5()).size).toBe(0);
            expect((await contract.getAddrMap6_6()).size).toBe(0);
            expect((await contract.getAddrMap6_7()).size).toBe(0);
            expect((await contract.getAddrMap7_1()).size).toBe(0);
            expect((await contract.getAddrMap7_2()).size).toBe(0);
            expect((await contract.getAddrMap7_3()).size).toBe(0);
            expect((await contract.getAddrMap7_4()).size).toBe(0);
            expect((await contract.getAddrMap7_5()).size).toBe(0);
            expect((await contract.getAddrMap7_6()).size).toBe(0);

            // Keys for test
            const keys: bigint[] = [];
            keys.push(1n);
            keys.push(0n);
            keys.push(-1n);
            keys.push(10102312312312312312312n);
            keys.push(-10102312312312312312312n);
            for (const k of keys) {
                // Check keys to be empty
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();

                // Set keys
                const valueInt = k * 10n;
                const valueBool = k < 0n;
                const addr = randomAddress(0, "addr-" + k.toString(10));
                const valueCell = beginCell().storeUint(123123, 128).endCell();
                const valueStruct: SomeStruct = {
                    $$type: "SomeStruct",
                    value: 10012312n,
                };
                const valueAddr = randomAddress(0, "value-" + k.toString(10));
                const keySmall = k % 100n;
                const keySmallAbs = (k > 0 ? k : -k) % 100n;
                const valueSmall = k % 100n;
                const valueSmallAbs = (k > 0 ? k : -k) % 100n;
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap1", key: k, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap2", key: k, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap3", key: k, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap4", key: k, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap5", key: k, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap6", key: keySmall, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap7",
                        key: keySmallAbs,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap8", key: k, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap9", key: k, value: valueSmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap1", key: addr, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap2", key: addr, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap3", key: addr, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap4", key: addr, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap5", key: addr, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap6", key: addr, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap7", key: addr, value: valueSmallAbs },
                );

                // Check value set
                expect(await contract.getIntMap1Value(k)).toBe(valueInt);
                expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
                expect(
                    (await contract.getIntMap3Value(k))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq((await contract.getIntMap4Value(k))!, valueStruct),
                ).toBe(true);
                expect(
                    (await contract.getIntMap5Value(k))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_2Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_3Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_4Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_5Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_6Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_7Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap9_1Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_2Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_3Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_4Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_5Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_6Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getIntMap10Value(keySmall, valueInt),
                ).toBe(valueInt * 7n);
                expect(
                    await contract.getIntMap11Value(keySmallAbs, valueInt),
                ).toBe(valueInt * 6n);
                expect(await contract.getIntMap12Value(k, valueSmall)).toBe(
                    valueSmall * 7n,
                );
                expect(await contract.getIntMap13Value(k, valueSmallAbs)).toBe(
                    valueSmallAbs * 7n,
                );
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(await contract.getAddrMap1Value(addr)).toBe(valueInt);
                expect((await contract.getAddrMap2Value(addr))!).toBe(
                    valueBool,
                );
                expect(
                    (await contract.getAddrMap3Value(addr))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq(
                        (await contract.getAddrMap4Value(addr))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    (await contract.getAddrMap5Value(addr))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getAddrMap6_1Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_2Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_3Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_4Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_5Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_6Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_7Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap7_1Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_2Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_3Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_4Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_5Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_6Value(addr)).toBe(
                    valueSmallAbs,
                );

                // Sizes
                expect((await contract.getIntMap1()).size).toBe(1);
                expect((await contract.getIntMap2()).size).toBe(1);
                expect((await contract.getIntMap3()).size).toBe(1);
                expect((await contract.getIntMap4()).size).toBe(1);
                expect((await contract.getIntMap5()).size).toBe(1);
                expect((await contract.getIntMap6_1()).size).toBe(1);
                expect((await contract.getIntMap6_2()).size).toBe(1);
                expect((await contract.getIntMap6_3()).size).toBe(1);
                expect((await contract.getIntMap6_4()).size).toBe(1);
                expect((await contract.getIntMap6_5()).size).toBe(1);
                expect((await contract.getIntMap6_6()).size).toBe(1);
                expect((await contract.getIntMap6_7()).size).toBe(1);
                expect((await contract.getIntMap7_1()).size).toBe(1);
                expect((await contract.getIntMap7_2()).size).toBe(1);
                expect((await contract.getIntMap7_3()).size).toBe(1);
                expect((await contract.getIntMap7_4()).size).toBe(1);
                expect((await contract.getIntMap7_5()).size).toBe(1);
                expect((await contract.getIntMap7_6()).size).toBe(1);
                expect((await contract.getIntMap8_1()).size).toBe(1);
                expect((await contract.getIntMap8_2()).size).toBe(1);
                expect((await contract.getIntMap8_3()).size).toBe(1);
                expect((await contract.getIntMap8_4()).size).toBe(1);
                expect((await contract.getIntMap8_5()).size).toBe(1);
                expect((await contract.getIntMap8_6()).size).toBe(1);
                expect((await contract.getIntMap8_7()).size).toBe(1);
                expect((await contract.getIntMap9_1()).size).toBe(1);
                expect((await contract.getIntMap9_2()).size).toBe(1);
                expect((await contract.getIntMap9_3()).size).toBe(1);
                expect((await contract.getIntMap9_4()).size).toBe(1);
                expect((await contract.getIntMap9_5()).size).toBe(1);
                expect((await contract.getIntMap9_6()).size).toBe(1);
                expect((await contract.getIntMap10_1()).size).toBe(1);
                expect((await contract.getIntMap10_2()).size).toBe(1);
                expect((await contract.getIntMap10_3()).size).toBe(1);
                expect((await contract.getIntMap10_4()).size).toBe(1);
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Check .del return value
                expect(await contract.getIntMap1Del(k)).toBe(true);
                expect(await contract.getIntMap1Del(k + 1n)).toBe(false);

                // Clear keys
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap1", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap2", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap3", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap4", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap5", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap6", key: keySmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelUIntMap7", key: keySmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelIntMap8", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelUIntMap9", key: k },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelUIntMap10", key: keySmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap1", key: addr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap2", key: addr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap3", key: addr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap4", key: addr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap5", key: addr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap6", key: addr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "DelAddrMap7", key: addr },
                );

                // Check value cleared
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();
                expect(await contract.getIntMap5Value(k)).toBeNull();
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(null);
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(null);
                expect(await contract.getIntMap8_2Value(k)).toBe(null);
                expect(await contract.getIntMap8_3Value(k)).toBe(null);
                expect(await contract.getIntMap8_4Value(k)).toBe(null);
                expect(await contract.getIntMap8_5Value(k)).toBe(null);
                expect(await contract.getIntMap8_6Value(k)).toBe(null);
                expect(await contract.getIntMap8_7Value(k)).toBe(null);
                expect(await contract.getIntMap9_1Value(k)).toBe(null);
                expect(await contract.getIntMap9_2Value(k)).toBe(null);
                expect(await contract.getIntMap9_3Value(k)).toBe(null);
                expect(await contract.getIntMap9_4Value(k)).toBe(null);
                expect(await contract.getIntMap9_5Value(k)).toBe(null);
                expect(await contract.getIntMap9_6Value(k)).toBe(null);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1Value(addr)).toBeNull();
                expect(await contract.getAddrMap2Value(addr)).toBeNull();
                expect(await contract.getAddrMap3Value(addr)).toBeNull();
                expect(await contract.getAddrMap4Value(addr)).toBeNull();
                expect(await contract.getAddrMap5Value(addr)).toBeNull();
                expect(await contract.getAddrMap6_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_6Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_7Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_6Value(addr)).toBe(null);
            }
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.logs) {
                    console.warn(e.logs);
                }
            }
            throw e;
        }
    });

    it("should implement map.exists correctly", async () => {
        jest.setTimeout(2 * 60000);
        try {
            // Initial state
            expect(await contract.getIntMap1Exists(1n)).toBe(false);
            expect(await contract.getIntMap2Exists(1n)).toBe(false);
            expect(await contract.getIntMap3Exists(1n)).toBe(false);
            expect(await contract.getIntMap4Exists(1n)).toBe(false);
            expect(
                await contract.getAddrMap1Exists(randomAddress(0, "addr-1")),
            ).toBe(false);
            expect(
                await contract.getAddrMap2Exists(randomAddress(0, "addr-1")),
            ).toBe(false);
            expect(
                await contract.getAddrMap3Exists(randomAddress(0, "addr-1")),
            ).toBe(false);
            expect(
                await contract.getAddrMap4Exists(randomAddress(0, "addr-1")),
            ).toBe(false);

            // Set keys
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap1", key: 1n, value: 1n },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap2", key: 1n, value: true },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                {
                    $$type: "SetIntMap3",
                    key: 1n,
                    value: beginCell().storeUint(123123, 128).endCell(),
                },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                {
                    $$type: "SetIntMap4",
                    key: 1n,
                    value: { $$type: "SomeStruct", value: 10012312n },
                },
            );
            const addr = randomAddress(0, "addr-1");
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetAddrMap1", key: addr, value: 1n },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetAddrMap2", key: addr, value: true },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                {
                    $$type: "SetAddrMap3",
                    key: addr,
                    value: beginCell().storeUint(123123, 128).endCell(),
                },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                {
                    $$type: "SetAddrMap4",
                    key: addr,
                    value: { $$type: "SomeStruct", value: 10012312n },
                },
            );

            // Check exists
            expect(await contract.getIntMap1Exists(1n)).toBe(true);
            expect(await contract.getIntMap2Exists(1n)).toBe(true);
            expect(await contract.getIntMap3Exists(1n)).toBe(true);
            expect(await contract.getIntMap4Exists(1n)).toBe(true);
            expect(await contract.getAddrMap1Exists(addr)).toBe(true);
            expect(await contract.getAddrMap2Exists(addr)).toBe(true);
            expect(await contract.getAddrMap3Exists(addr)).toBe(true);
            expect(await contract.getAddrMap4Exists(addr)).toBe(true);

            // Clear keys
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap1", key: 1n, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap2", key: 1n, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap3", key: 1n, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetIntMap4", key: 1n, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetAddrMap1", key: addr, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetAddrMap2", key: addr, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetAddrMap3", key: addr, value: null },
            );
            await contract.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "SetAddrMap4", key: addr, value: null },
            );

            // Check exists
            expect(await contract.getIntMap1Exists(1n)).toBe(false);
            expect(await contract.getIntMap2Exists(1n)).toBe(false);
            expect(await contract.getIntMap3Exists(1n)).toBe(false);
            expect(await contract.getIntMap4Exists(1n)).toBe(false);
            expect(await contract.getAddrMap1Exists(addr)).toBe(false);
            expect(await contract.getAddrMap2Exists(addr)).toBe(false);
            expect(await contract.getAddrMap3Exists(addr)).toBe(false);
            expect(await contract.getAddrMap4Exists(addr)).toBe(false);
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.logs) {
                    console.warn(e.logs);
                }
            }
            throw e;
        }
    });

    it("should implement map.replace correctly", async () => {
        jest.setTimeout(2 * 60000);
        try {
            // Initial state
            expect((await contract.getIntMap1()).size).toBe(0);
            expect((await contract.getIntMap2()).size).toBe(0);
            expect((await contract.getIntMap3()).size).toBe(0);
            expect((await contract.getIntMap4()).size).toBe(0);
            expect((await contract.getIntMap5()).size).toBe(0);
            expect((await contract.getIntMap6_1()).size).toBe(0);
            expect((await contract.getIntMap6_2()).size).toBe(0);
            expect((await contract.getIntMap6_3()).size).toBe(0);
            expect((await contract.getIntMap6_4()).size).toBe(0);
            expect((await contract.getIntMap6_5()).size).toBe(0);
            expect((await contract.getIntMap6_6()).size).toBe(0);
            expect((await contract.getIntMap6_7()).size).toBe(0);
            expect((await contract.getIntMap7_1()).size).toBe(0);
            expect((await contract.getIntMap7_2()).size).toBe(0);
            expect((await contract.getIntMap7_3()).size).toBe(0);
            expect((await contract.getIntMap7_4()).size).toBe(0);
            expect((await contract.getIntMap7_5()).size).toBe(0);
            expect((await contract.getIntMap7_6()).size).toBe(0);
            expect((await contract.getIntMap8_1()).size).toBe(0);
            expect((await contract.getIntMap8_2()).size).toBe(0);
            expect((await contract.getIntMap8_3()).size).toBe(0);
            expect((await contract.getIntMap8_4()).size).toBe(0);
            expect((await contract.getIntMap8_5()).size).toBe(0);
            expect((await contract.getIntMap8_6()).size).toBe(0);
            expect((await contract.getIntMap8_7()).size).toBe(0);
            expect((await contract.getIntMap9_1()).size).toBe(0);
            expect((await contract.getIntMap9_2()).size).toBe(0);
            expect((await contract.getIntMap9_3()).size).toBe(0);
            expect((await contract.getIntMap9_4()).size).toBe(0);
            expect((await contract.getIntMap9_5()).size).toBe(0);
            expect((await contract.getIntMap9_6()).size).toBe(0);
            expect((await contract.getIntMap10_1()).size).toBe(0);
            expect((await contract.getIntMap10_2()).size).toBe(0);
            expect((await contract.getIntMap10_3()).size).toBe(0);
            expect((await contract.getIntMap10_4()).size).toBe(0);
            expect((await contract.getAddrMap1()).size).toBe(0);
            expect((await contract.getAddrMap2()).size).toBe(0);
            expect((await contract.getAddrMap3()).size).toBe(0);
            expect((await contract.getAddrMap4()).size).toBe(0);
            expect((await contract.getAddrMap6_1()).size).toBe(0);
            expect((await contract.getAddrMap6_2()).size).toBe(0);
            expect((await contract.getAddrMap6_3()).size).toBe(0);
            expect((await contract.getAddrMap6_4()).size).toBe(0);
            expect((await contract.getAddrMap6_5()).size).toBe(0);
            expect((await contract.getAddrMap6_6()).size).toBe(0);
            expect((await contract.getAddrMap6_7()).size).toBe(0);
            expect((await contract.getAddrMap7_1()).size).toBe(0);
            expect((await contract.getAddrMap7_2()).size).toBe(0);
            expect((await contract.getAddrMap7_3()).size).toBe(0);
            expect((await contract.getAddrMap7_4()).size).toBe(0);
            expect((await contract.getAddrMap7_5()).size).toBe(0);
            expect((await contract.getAddrMap7_6()).size).toBe(0);

            // Keys for test
            const keys: bigint[] = [];
            keys.push(1n);
            keys.push(0n);
            keys.push(-1n);
            keys.push(10102312312312312312312n);
            keys.push(-10102312312312312312312n);
            for (const k of keys) {
                // Check keys to be empty
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();

                // Set keys
                const valueInt = k * 10n;
                const valueBool = k < 0n;
                const addr = randomAddress(0, "addr-" + k.toString(10));
                const valueCell = beginCell().storeUint(123123, 128).endCell();
                const valueStruct: SomeStruct = {
                    $$type: "SomeStruct",
                    value: 10012312n,
                };
                const valueAddr = randomAddress(0, "value-" + k.toString(10));
                const keySmall = k % 100n;
                const keySmallAbs = (k > 0 ? k : -k) % 100n;
                const valueSmall = k % 100n;
                const valueSmallAbs = (k > 0 ? k : -k) % 100n;
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap1", key: k, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap2", key: k, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap3", key: k, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap4", key: k, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap5", key: k, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap6", key: keySmall, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap7",
                        key: keySmallAbs,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap8", key: k, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap9", key: k, value: valueSmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap1", key: addr, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap2", key: addr, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap3", key: addr, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap4", key: addr, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap5", key: addr, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap6", key: addr, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap7", key: addr, value: valueSmallAbs },
                );

                // Check value set
                expect(await contract.getIntMap1Value(k)).toBe(valueInt);
                expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
                expect(
                    (await contract.getIntMap3Value(k))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq((await contract.getIntMap4Value(k))!, valueStruct),
                ).toBe(true);
                expect(
                    (await contract.getIntMap5Value(k))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_2Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_3Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_4Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_5Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_6Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_7Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap9_1Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_2Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_3Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_4Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_5Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_6Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getIntMap10Value(keySmall, valueInt),
                ).toBe(valueInt * 7n);
                expect(
                    await contract.getIntMap11Value(keySmallAbs, valueInt),
                ).toBe(valueInt * 6n);
                expect(await contract.getIntMap12Value(k, valueSmall)).toBe(
                    valueSmall * 7n,
                );
                expect(await contract.getIntMap13Value(k, valueSmallAbs)).toBe(
                    valueSmallAbs * 7n,
                );
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(await contract.getAddrMap1Value(addr)).toBe(valueInt);
                expect((await contract.getAddrMap2Value(addr))!).toBe(
                    valueBool,
                );
                expect(
                    (await contract.getAddrMap3Value(addr))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq(
                        (await contract.getAddrMap4Value(addr))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    (await contract.getAddrMap5Value(addr))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getAddrMap6_1Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_2Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_3Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_4Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_5Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_6Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_7Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap7_1Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_2Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_3Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_4Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_5Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_6Value(addr)).toBe(
                    valueSmallAbs,
                );

                // Sizes
                expect((await contract.getIntMap1()).size).toBe(1);
                expect((await contract.getIntMap2()).size).toBe(1);
                expect((await contract.getIntMap3()).size).toBe(1);
                expect((await contract.getIntMap4()).size).toBe(1);
                expect((await contract.getIntMap5()).size).toBe(1);
                expect((await contract.getIntMap6_1()).size).toBe(1);
                expect((await contract.getIntMap6_2()).size).toBe(1);
                expect((await contract.getIntMap6_3()).size).toBe(1);
                expect((await contract.getIntMap6_4()).size).toBe(1);
                expect((await contract.getIntMap6_5()).size).toBe(1);
                expect((await contract.getIntMap6_6()).size).toBe(1);
                expect((await contract.getIntMap6_7()).size).toBe(1);
                expect((await contract.getIntMap7_1()).size).toBe(1);
                expect((await contract.getIntMap7_2()).size).toBe(1);
                expect((await contract.getIntMap7_3()).size).toBe(1);
                expect((await contract.getIntMap7_4()).size).toBe(1);
                expect((await contract.getIntMap7_5()).size).toBe(1);
                expect((await contract.getIntMap7_6()).size).toBe(1);
                expect((await contract.getIntMap8_1()).size).toBe(1);
                expect((await contract.getIntMap8_2()).size).toBe(1);
                expect((await contract.getIntMap8_3()).size).toBe(1);
                expect((await contract.getIntMap8_4()).size).toBe(1);
                expect((await contract.getIntMap8_5()).size).toBe(1);
                expect((await contract.getIntMap8_6()).size).toBe(1);
                expect((await contract.getIntMap8_7()).size).toBe(1);
                expect((await contract.getIntMap9_1()).size).toBe(1);
                expect((await contract.getIntMap9_2()).size).toBe(1);
                expect((await contract.getIntMap9_3()).size).toBe(1);
                expect((await contract.getIntMap9_4()).size).toBe(1);
                expect((await contract.getIntMap9_5()).size).toBe(1);
                expect((await contract.getIntMap9_6()).size).toBe(1);
                expect((await contract.getIntMap10_1()).size).toBe(1);
                expect((await contract.getIntMap10_2()).size).toBe(1);
                expect((await contract.getIntMap10_3()).size).toBe(1);
                expect((await contract.getIntMap10_4()).size).toBe(1);
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Check .replace return value
                expect(await contract.getIntMap1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Replace values
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap1", key: k, value: valueInt + 1n },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap2", key: k, value: !valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceIntMap3",
                        key: k,
                        value: beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceIntMap4",
                        key: k,
                        value: {
                            $$type: "SomeStruct",
                            value: 10012312n + 1n,
                        },
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceIntMap5",
                        key: k,
                        value: randomAddress(
                            0,
                            "value-" + (k + 1n).toString(10),
                        ),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceIntMap6",
                        key: keySmall,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap7",
                        key: keySmallAbs,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceIntMap8",
                        key: k,
                        value: valueSmall + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap9",
                        key: k,
                        value: valueSmallAbs + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap1",
                        key: addr,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap2", key: addr, value: !valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap3",
                        key: addr,
                        value: beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap4",
                        key: addr,
                        value: {
                            $$type: "SomeStruct",
                            value: 10012312n + 1n,
                        },
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap5",
                        key: addr,
                        value: randomAddress(
                            0,
                            "value-" + (k + 1n).toString(10),
                        ),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap6",
                        key: addr,
                        value: valueSmall + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap7",
                        key: addr,
                        value: valueSmallAbs + 1n,
                    },
                );

                // Check values replaced
                expect(await contract.getIntMap1Value(k)).toBe(valueInt + 1n);
                expect((await contract.getIntMap2Value(k))!).toBe(!valueBool);
                expect(
                    (await contract.getIntMap3Value(k))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    strEq((await contract.getIntMap4Value(k))!, {
                        $$type: "SomeStruct",
                        value: 10012312n + 1n,
                    }),
                ).toBe(true);
                expect(
                    (await contract.getIntMap5Value(k))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_2Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_3Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_4Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_5Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_6Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_7Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap9_1Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_2Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_3Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_4Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_5Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_6Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap1Value(addr)).toBe(
                    valueInt + 1n,
                );
                expect((await contract.getAddrMap2Value(addr))!).toBe(
                    !valueBool,
                );
                expect(
                    (await contract.getAddrMap3Value(addr))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    strEq((await contract.getAddrMap4Value(addr))!, {
                        $$type: "SomeStruct",
                        value: 10012312n + 1n,
                    }),
                ).toBe(true);
                expect(
                    (await contract.getAddrMap5Value(addr))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(await contract.getAddrMap6_1Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_2Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_3Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_4Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_5Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_6Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_7Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap7_1Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_2Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_3Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_4Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_5Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_6Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );

                // Sizes
                expect((await contract.getIntMap1()).size).toBe(1);
                expect((await contract.getIntMap2()).size).toBe(1);
                expect((await contract.getIntMap3()).size).toBe(1);
                expect((await contract.getIntMap4()).size).toBe(1);
                expect((await contract.getIntMap5()).size).toBe(1);
                expect((await contract.getIntMap6_1()).size).toBe(1);
                expect((await contract.getIntMap6_2()).size).toBe(1);
                expect((await contract.getIntMap6_3()).size).toBe(1);
                expect((await contract.getIntMap6_4()).size).toBe(1);
                expect((await contract.getIntMap6_5()).size).toBe(1);
                expect((await contract.getIntMap6_6()).size).toBe(1);
                expect((await contract.getIntMap6_7()).size).toBe(1);
                expect((await contract.getIntMap7_1()).size).toBe(1);
                expect((await contract.getIntMap7_2()).size).toBe(1);
                expect((await contract.getIntMap7_3()).size).toBe(1);
                expect((await contract.getIntMap7_4()).size).toBe(1);
                expect((await contract.getIntMap7_5()).size).toBe(1);
                expect((await contract.getIntMap7_6()).size).toBe(1);
                expect((await contract.getIntMap8_1()).size).toBe(1);
                expect((await contract.getIntMap8_2()).size).toBe(1);
                expect((await contract.getIntMap8_3()).size).toBe(1);
                expect((await contract.getIntMap8_4()).size).toBe(1);
                expect((await contract.getIntMap8_5()).size).toBe(1);
                expect((await contract.getIntMap8_6()).size).toBe(1);
                expect((await contract.getIntMap8_7()).size).toBe(1);
                expect((await contract.getIntMap9_1()).size).toBe(1);
                expect((await contract.getIntMap9_2()).size).toBe(1);
                expect((await contract.getIntMap9_3()).size).toBe(1);
                expect((await contract.getIntMap9_4()).size).toBe(1);
                expect((await contract.getIntMap9_5()).size).toBe(1);
                expect((await contract.getIntMap9_6()).size).toBe(1);
                expect((await contract.getIntMap10_1()).size).toBe(1);
                expect((await contract.getIntMap10_2()).size).toBe(1);
                expect((await contract.getIntMap10_3()).size).toBe(1);
                expect((await contract.getIntMap10_4()).size).toBe(1);
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Clear keys with .replace
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap1", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap2", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap3", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap4", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap5", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap6", key: keySmall, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap7",
                        key: keySmallAbs,
                        value: null,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap8", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceUIntMap9", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap10",
                        key: keySmallAbs,
                        value: null,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap1", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap2", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap3", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap4", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap5", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap6", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap7", key: addr, value: null },
                );

                // Check value cleared
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();
                expect(await contract.getIntMap5Value(k)).toBeNull();
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(null);
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(null);
                expect(await contract.getIntMap8_2Value(k)).toBe(null);
                expect(await contract.getIntMap8_3Value(k)).toBe(null);
                expect(await contract.getIntMap8_4Value(k)).toBe(null);
                expect(await contract.getIntMap8_5Value(k)).toBe(null);
                expect(await contract.getIntMap8_6Value(k)).toBe(null);
                expect(await contract.getIntMap8_7Value(k)).toBe(null);
                expect(await contract.getIntMap9_1Value(k)).toBe(null);
                expect(await contract.getIntMap9_2Value(k)).toBe(null);
                expect(await contract.getIntMap9_3Value(k)).toBe(null);
                expect(await contract.getIntMap9_4Value(k)).toBe(null);
                expect(await contract.getIntMap9_5Value(k)).toBe(null);
                expect(await contract.getIntMap9_6Value(k)).toBe(null);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1Value(addr)).toBeNull();
                expect(await contract.getAddrMap2Value(addr)).toBeNull();
                expect(await contract.getAddrMap3Value(addr)).toBeNull();
                expect(await contract.getAddrMap4Value(addr)).toBeNull();
                expect(await contract.getAddrMap5Value(addr)).toBeNull();
                expect(await contract.getAddrMap6_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_6Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_7Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_6Value(addr)).toBe(null);

                // Check that .replace doesn't do anything on non-existing keys
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap1", key: k, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap2", key: k, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap3", key: k, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap4", key: k, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap5", key: k, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceIntMap6",
                        key: keySmall,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap7",
                        key: keySmallAbs,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceIntMap8", key: k, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceUIntMap9", key: k, value: valueSmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap1", key: addr, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap2", key: addr, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap3", key: addr, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap4",
                        key: addr,
                        value: valueStruct,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap5", key: addr, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceAddrMap6", key: addr, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceAddrMap7",
                        key: addr,
                        value: valueSmallAbs,
                    },
                );

                // Check value not changed
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();
                expect(await contract.getIntMap5Value(k)).toBeNull();
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(null);
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(null);
                expect(await contract.getIntMap8_2Value(k)).toBe(null);
                expect(await contract.getIntMap8_3Value(k)).toBe(null);
                expect(await contract.getIntMap8_4Value(k)).toBe(null);
                expect(await contract.getIntMap8_5Value(k)).toBe(null);
                expect(await contract.getIntMap8_6Value(k)).toBe(null);
                expect(await contract.getIntMap8_7Value(k)).toBe(null);
                expect(await contract.getIntMap9_1Value(k)).toBe(null);
                expect(await contract.getIntMap9_2Value(k)).toBe(null);
                expect(await contract.getIntMap9_3Value(k)).toBe(null);
                expect(await contract.getIntMap9_4Value(k)).toBe(null);
                expect(await contract.getIntMap9_5Value(k)).toBe(null);
                expect(await contract.getIntMap9_6Value(k)).toBe(null);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1Value(addr)).toBeNull();
                expect(await contract.getAddrMap2Value(addr)).toBeNull();
                expect(await contract.getAddrMap3Value(addr)).toBeNull();
                expect(await contract.getAddrMap4Value(addr)).toBeNull();
                expect(await contract.getAddrMap5Value(addr)).toBeNull();
                expect(await contract.getAddrMap6_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_6Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_7Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_6Value(addr)).toBe(null);
            }
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.logs) {
                    console.warn(e.logs);
                }
            }
            throw e;
        }
    });

    it("should implement map.replaceGet correctly", async () => {
        jest.setTimeout(2 * 60000);
        try {
            // Initial state
            expect((await contract.getIntMap1()).size).toBe(0);
            expect((await contract.getIntMap2()).size).toBe(0);
            expect((await contract.getIntMap3()).size).toBe(0);
            expect((await contract.getIntMap4()).size).toBe(0);
            expect((await contract.getIntMap5()).size).toBe(0);
            expect((await contract.getIntMap6_1()).size).toBe(0);
            expect((await contract.getIntMap6_2()).size).toBe(0);
            expect((await contract.getIntMap6_3()).size).toBe(0);
            expect((await contract.getIntMap6_4()).size).toBe(0);
            expect((await contract.getIntMap6_5()).size).toBe(0);
            expect((await contract.getIntMap6_6()).size).toBe(0);
            expect((await contract.getIntMap6_7()).size).toBe(0);
            expect((await contract.getIntMap7_1()).size).toBe(0);
            expect((await contract.getIntMap7_2()).size).toBe(0);
            expect((await contract.getIntMap7_3()).size).toBe(0);
            expect((await contract.getIntMap7_4()).size).toBe(0);
            expect((await contract.getIntMap7_5()).size).toBe(0);
            expect((await contract.getIntMap7_6()).size).toBe(0);
            expect((await contract.getIntMap8_1()).size).toBe(0);
            expect((await contract.getIntMap8_2()).size).toBe(0);
            expect((await contract.getIntMap8_3()).size).toBe(0);
            expect((await contract.getIntMap8_4()).size).toBe(0);
            expect((await contract.getIntMap8_5()).size).toBe(0);
            expect((await contract.getIntMap8_6()).size).toBe(0);
            expect((await contract.getIntMap8_7()).size).toBe(0);
            expect((await contract.getIntMap9_1()).size).toBe(0);
            expect((await contract.getIntMap9_2()).size).toBe(0);
            expect((await contract.getIntMap9_3()).size).toBe(0);
            expect((await contract.getIntMap9_4()).size).toBe(0);
            expect((await contract.getIntMap9_5()).size).toBe(0);
            expect((await contract.getIntMap9_6()).size).toBe(0);
            expect((await contract.getIntMap10_1()).size).toBe(0);
            expect((await contract.getIntMap10_2()).size).toBe(0);
            expect((await contract.getIntMap10_3()).size).toBe(0);
            expect((await contract.getIntMap10_4()).size).toBe(0);
            expect((await contract.getAddrMap1()).size).toBe(0);
            expect((await contract.getAddrMap2()).size).toBe(0);
            expect((await contract.getAddrMap3()).size).toBe(0);
            expect((await contract.getAddrMap4()).size).toBe(0);
            expect((await contract.getAddrMap6_1()).size).toBe(0);
            expect((await contract.getAddrMap6_2()).size).toBe(0);
            expect((await contract.getAddrMap6_3()).size).toBe(0);
            expect((await contract.getAddrMap6_4()).size).toBe(0);
            expect((await contract.getAddrMap6_5()).size).toBe(0);
            expect((await contract.getAddrMap6_6()).size).toBe(0);
            expect((await contract.getAddrMap6_7()).size).toBe(0);
            expect((await contract.getAddrMap7_1()).size).toBe(0);
            expect((await contract.getAddrMap7_2()).size).toBe(0);
            expect((await contract.getAddrMap7_3()).size).toBe(0);
            expect((await contract.getAddrMap7_4()).size).toBe(0);
            expect((await contract.getAddrMap7_5()).size).toBe(0);
            expect((await contract.getAddrMap7_6()).size).toBe(0);

            // Keys for test
            const keys: bigint[] = [];
            keys.push(1n);
            keys.push(0n);
            keys.push(-1n);
            keys.push(10102312312312312312312n);
            keys.push(-10102312312312312312312n);
            for (const k of keys) {
                // Check keys to be empty
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();

                // Set keys
                const valueInt = k * 10n;
                const valueBool = k < 0n;
                const addr = randomAddress(0, "addr-" + k.toString(10));
                const valueCell = beginCell().storeUint(123123, 128).endCell();
                const valueStruct: SomeStruct = {
                    $$type: "SomeStruct",
                    value: 10012312n,
                };
                const valueAddr = randomAddress(0, "value-" + k.toString(10));
                const keySmall = k % 100n;
                const keySmallAbs = (k > 0 ? k : -k) % 100n;
                const valueSmall = k % 100n;
                const valueSmallAbs = (k > 0 ? k : -k) % 100n;
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap1", key: k, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap2", key: k, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap3", key: k, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap4", key: k, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap5", key: k, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap6", key: keySmall, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap7",
                        key: keySmallAbs,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetIntMap8", key: k, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetUIntMap9", key: k, value: valueSmallAbs },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "SetUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap1", key: addr, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap2", key: addr, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap3", key: addr, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap4", key: addr, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap5", key: addr, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap6", key: addr, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "SetAddrMap7", key: addr, value: valueSmallAbs },
                );

                // Check value set
                expect(await contract.getIntMap1Value(k)).toBe(valueInt);
                expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
                expect(
                    (await contract.getIntMap3Value(k))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq((await contract.getIntMap4Value(k))!, valueStruct),
                ).toBe(true);
                expect(
                    (await contract.getIntMap5Value(k))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_2Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_3Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_4Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_5Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_6Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap8_7Value(k)).toBe(valueSmall);
                expect(await contract.getIntMap9_1Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_2Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_3Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_4Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_5Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap9_6Value(k)).toBe(valueSmallAbs);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getIntMap10Value(keySmall, valueInt),
                ).toBe(valueInt * 7n);
                expect(
                    await contract.getIntMap11Value(keySmallAbs, valueInt),
                ).toBe(valueInt * 6n);
                expect(await contract.getIntMap12Value(k, valueSmall)).toBe(
                    valueSmall * 7n,
                );
                expect(await contract.getIntMap13Value(k, valueSmallAbs)).toBe(
                    valueSmallAbs * 7n,
                );
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(
                    await contract.getIntMap14Value(keySmallAbs, valueSmallAbs),
                ).toBe(valueSmallAbs * 4n);
                expect(await contract.getAddrMap1Value(addr)).toBe(valueInt);
                expect((await contract.getAddrMap2Value(addr))!).toBe(
                    valueBool,
                );
                expect(
                    (await contract.getAddrMap3Value(addr))!.equals(valueCell),
                ).toBe(true);
                expect(
                    strEq(
                        (await contract.getAddrMap4Value(addr))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    (await contract.getAddrMap5Value(addr))!.equals(valueAddr),
                ).toBe(true);
                expect(await contract.getAddrMap6_1Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_2Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_3Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_4Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_5Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_6Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap6_7Value(addr)).toBe(
                    valueSmall,
                );
                expect(await contract.getAddrMap7_1Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_2Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_3Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_4Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_5Value(addr)).toBe(
                    valueSmallAbs,
                );
                expect(await contract.getAddrMap7_6Value(addr)).toBe(
                    valueSmallAbs,
                );

                // Sizes
                expect((await contract.getIntMap1()).size).toBe(1);
                expect((await contract.getIntMap2()).size).toBe(1);
                expect((await contract.getIntMap3()).size).toBe(1);
                expect((await contract.getIntMap4()).size).toBe(1);
                expect((await contract.getIntMap5()).size).toBe(1);
                expect((await contract.getIntMap6_1()).size).toBe(1);
                expect((await contract.getIntMap6_2()).size).toBe(1);
                expect((await contract.getIntMap6_3()).size).toBe(1);
                expect((await contract.getIntMap6_4()).size).toBe(1);
                expect((await contract.getIntMap6_5()).size).toBe(1);
                expect((await contract.getIntMap6_6()).size).toBe(1);
                expect((await contract.getIntMap6_7()).size).toBe(1);
                expect((await contract.getIntMap7_1()).size).toBe(1);
                expect((await contract.getIntMap7_2()).size).toBe(1);
                expect((await contract.getIntMap7_3()).size).toBe(1);
                expect((await contract.getIntMap7_4()).size).toBe(1);
                expect((await contract.getIntMap7_5()).size).toBe(1);
                expect((await contract.getIntMap7_6()).size).toBe(1);
                expect((await contract.getIntMap8_1()).size).toBe(1);
                expect((await contract.getIntMap8_2()).size).toBe(1);
                expect((await contract.getIntMap8_3()).size).toBe(1);
                expect((await contract.getIntMap8_4()).size).toBe(1);
                expect((await contract.getIntMap8_5()).size).toBe(1);
                expect((await contract.getIntMap8_6()).size).toBe(1);
                expect((await contract.getIntMap8_7()).size).toBe(1);
                expect((await contract.getIntMap9_1()).size).toBe(1);
                expect((await contract.getIntMap9_2()).size).toBe(1);
                expect((await contract.getIntMap9_3()).size).toBe(1);
                expect((await contract.getIntMap9_4()).size).toBe(1);
                expect((await contract.getIntMap9_5()).size).toBe(1);
                expect((await contract.getIntMap9_6()).size).toBe(1);
                expect((await contract.getIntMap10_1()).size).toBe(1);
                expect((await contract.getIntMap10_2()).size).toBe(1);
                expect((await contract.getIntMap10_3()).size).toBe(1);
                expect((await contract.getIntMap10_4()).size).toBe(1);
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Check .replaceGet return value
                expect(await contract.getIntMap1ReplaceGet(k, null)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap1ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap1ReplaceGet(k, 123n)).toBe(
                    valueInt,
                );
                expect(await contract.getIntMap1ReplaceGet(k + 1n, 123n)).toBe(
                    null,
                );

                // ReplaceGet values
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap1",
                        key: k,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap2", key: k, value: !valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap3",
                        key: k,
                        value: beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap4",
                        key: k,
                        value: {
                            $$type: "SomeStruct",
                            value: 10012312n + 1n,
                        },
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap5",
                        key: k,
                        value: randomAddress(
                            0,
                            "value-" + (k + 1n).toString(10),
                        ),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap6",
                        key: keySmall,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap7",
                        key: keySmallAbs,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap8",
                        key: k,
                        value: valueSmall + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap9",
                        key: k,
                        value: valueSmallAbs + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap1",
                        key: addr,
                        value: valueInt + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap2",
                        key: addr,
                        value: !valueBool,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap3",
                        key: addr,
                        value: beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap4",
                        key: addr,
                        value: {
                            $$type: "SomeStruct",
                            value: 10012312n + 1n,
                        },
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap5",
                        key: addr,
                        value: randomAddress(
                            0,
                            "value-" + (k + 1n).toString(10),
                        ),
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap6",
                        key: addr,
                        value: valueSmall + 1n,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap7",
                        key: addr,
                        value: valueSmallAbs + 1n,
                    },
                );

                // Check values replaced
                expect(await contract.getIntMap1Value(k)).toBe(valueInt + 1n);
                expect((await contract.getIntMap2Value(k))!).toBe(!valueBool);
                expect(
                    (await contract.getIntMap3Value(k))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    strEq((await contract.getIntMap4Value(k))!, {
                        $$type: "SomeStruct",
                        value: 10012312n + 1n,
                    }),
                ).toBe(true);
                expect(
                    (await contract.getIntMap5Value(k))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_2Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_3Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_4Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_5Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_6Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap8_7Value(k)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getIntMap9_1Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_2Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_3Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_4Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_5Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap9_6Value(k)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap1Value(addr)).toBe(
                    valueInt + 1n,
                );
                expect((await contract.getAddrMap2Value(addr))!).toBe(
                    !valueBool,
                );
                expect(
                    (await contract.getAddrMap3Value(addr))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    strEq((await contract.getAddrMap4Value(addr))!, {
                        $$type: "SomeStruct",
                        value: 10012312n + 1n,
                    }),
                ).toBe(true);
                expect(
                    (await contract.getAddrMap5Value(addr))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(await contract.getAddrMap6_1Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_2Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_3Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_4Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_5Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_6Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap6_7Value(addr)).toBe(
                    valueSmall + 1n,
                );
                expect(await contract.getAddrMap7_1Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_2Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_3Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_4Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_5Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(await contract.getAddrMap7_6Value(addr)).toBe(
                    valueSmallAbs + 1n,
                );

                // Sizes
                expect((await contract.getIntMap1()).size).toBe(1);
                expect((await contract.getIntMap2()).size).toBe(1);
                expect((await contract.getIntMap3()).size).toBe(1);
                expect((await contract.getIntMap4()).size).toBe(1);
                expect((await contract.getIntMap5()).size).toBe(1);
                expect((await contract.getIntMap6_1()).size).toBe(1);
                expect((await contract.getIntMap6_2()).size).toBe(1);
                expect((await contract.getIntMap6_3()).size).toBe(1);
                expect((await contract.getIntMap6_4()).size).toBe(1);
                expect((await contract.getIntMap6_5()).size).toBe(1);
                expect((await contract.getIntMap6_6()).size).toBe(1);
                expect((await contract.getIntMap6_7()).size).toBe(1);
                expect((await contract.getIntMap7_1()).size).toBe(1);
                expect((await contract.getIntMap7_2()).size).toBe(1);
                expect((await contract.getIntMap7_3()).size).toBe(1);
                expect((await contract.getIntMap7_4()).size).toBe(1);
                expect((await contract.getIntMap7_5()).size).toBe(1);
                expect((await contract.getIntMap7_6()).size).toBe(1);
                expect((await contract.getIntMap8_1()).size).toBe(1);
                expect((await contract.getIntMap8_2()).size).toBe(1);
                expect((await contract.getIntMap8_3()).size).toBe(1);
                expect((await contract.getIntMap8_4()).size).toBe(1);
                expect((await contract.getIntMap8_5()).size).toBe(1);
                expect((await contract.getIntMap8_6()).size).toBe(1);
                expect((await contract.getIntMap8_7()).size).toBe(1);
                expect((await contract.getIntMap9_1()).size).toBe(1);
                expect((await contract.getIntMap9_2()).size).toBe(1);
                expect((await contract.getIntMap9_3()).size).toBe(1);
                expect((await contract.getIntMap9_4()).size).toBe(1);
                expect((await contract.getIntMap9_5()).size).toBe(1);
                expect((await contract.getIntMap9_6()).size).toBe(1);
                expect((await contract.getIntMap10_1()).size).toBe(1);
                expect((await contract.getIntMap10_2()).size).toBe(1);
                expect((await contract.getIntMap10_3()).size).toBe(1);
                expect((await contract.getIntMap10_4()).size).toBe(1);
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Clear keys with .replaceGet
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap1", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap2", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap3", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap4", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap5", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap6", key: keySmall, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap7",
                        key: keySmallAbs,
                        value: null,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap8", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetUIntMap9", key: k, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap10",
                        key: keySmallAbs,
                        value: null,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap1", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap2", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap3", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap4", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap5", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap6", key: addr, value: null },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetAddrMap7", key: addr, value: null },
                );

                // Check value cleared
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();
                expect(await contract.getIntMap5Value(k)).toBeNull();
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(null);
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(null);
                expect(await contract.getIntMap8_2Value(k)).toBe(null);
                expect(await contract.getIntMap8_3Value(k)).toBe(null);
                expect(await contract.getIntMap8_4Value(k)).toBe(null);
                expect(await contract.getIntMap8_5Value(k)).toBe(null);
                expect(await contract.getIntMap8_6Value(k)).toBe(null);
                expect(await contract.getIntMap8_7Value(k)).toBe(null);
                expect(await contract.getIntMap9_1Value(k)).toBe(null);
                expect(await contract.getIntMap9_2Value(k)).toBe(null);
                expect(await contract.getIntMap9_3Value(k)).toBe(null);
                expect(await contract.getIntMap9_4Value(k)).toBe(null);
                expect(await contract.getIntMap9_5Value(k)).toBe(null);
                expect(await contract.getIntMap9_6Value(k)).toBe(null);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1Value(addr)).toBeNull();
                expect(await contract.getAddrMap2Value(addr)).toBeNull();
                expect(await contract.getAddrMap3Value(addr)).toBeNull();
                expect(await contract.getAddrMap4Value(addr)).toBeNull();
                expect(await contract.getAddrMap5Value(addr)).toBeNull();
                expect(await contract.getAddrMap6_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_6Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_7Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_6Value(addr)).toBe(null);

                // Check that .replaceGet doesn't do anything on non-existing keys
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap1", key: k, value: valueInt },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap2", key: k, value: valueBool },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap3", key: k, value: valueCell },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap4", key: k, value: valueStruct },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap5", key: k, value: valueAddr },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetIntMap6",
                        key: keySmall,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap7",
                        key: keySmallAbs,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    { $$type: "ReplaceGetIntMap8", key: k, value: valueSmall },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap9",
                        key: k,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetUIntMap10",
                        key: keySmallAbs,
                        value: valueSmallAbs,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap1",
                        key: addr,
                        value: valueInt,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap2",
                        key: addr,
                        value: valueBool,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap3",
                        key: addr,
                        value: valueCell,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap4",
                        key: addr,
                        value: valueStruct,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap5",
                        key: addr,
                        value: valueAddr,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap6",
                        key: addr,
                        value: valueSmall,
                    },
                );
                await contract.send(
                    treasure.getSender(),
                    { value: toNano(1) },
                    {
                        $$type: "ReplaceGetAddrMap7",
                        key: addr,
                        value: valueSmallAbs,
                    },
                );

                // Check value not changed
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();
                expect(await contract.getIntMap5Value(k)).toBeNull();
                expect(await contract.getIntMap6_1Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_2Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_3Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_4Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_5Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_6Value(keySmall)).toBe(null);
                expect(await contract.getIntMap6_7Value(keySmall)).toBe(null);
                expect(await contract.getIntMap7_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_5Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap7_6Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1Value(k)).toBe(null);
                expect(await contract.getIntMap8_2Value(k)).toBe(null);
                expect(await contract.getIntMap8_3Value(k)).toBe(null);
                expect(await contract.getIntMap8_4Value(k)).toBe(null);
                expect(await contract.getIntMap8_5Value(k)).toBe(null);
                expect(await contract.getIntMap8_6Value(k)).toBe(null);
                expect(await contract.getIntMap8_7Value(k)).toBe(null);
                expect(await contract.getIntMap9_1Value(k)).toBe(null);
                expect(await contract.getIntMap9_2Value(k)).toBe(null);
                expect(await contract.getIntMap9_3Value(k)).toBe(null);
                expect(await contract.getIntMap9_4Value(k)).toBe(null);
                expect(await contract.getIntMap9_5Value(k)).toBe(null);
                expect(await contract.getIntMap9_6Value(k)).toBe(null);
                expect(await contract.getIntMap10_1Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_2Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_3Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getIntMap10_4Value(keySmallAbs)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1Value(addr)).toBeNull();
                expect(await contract.getAddrMap2Value(addr)).toBeNull();
                expect(await contract.getAddrMap3Value(addr)).toBeNull();
                expect(await contract.getAddrMap4Value(addr)).toBeNull();
                expect(await contract.getAddrMap5Value(addr)).toBeNull();
                expect(await contract.getAddrMap6_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_6Value(addr)).toBe(null);
                expect(await contract.getAddrMap6_7Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_1Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_2Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_3Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_4Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_5Value(addr)).toBe(null);
                expect(await contract.getAddrMap7_6Value(addr)).toBe(null);
            }
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.logs) {
                    console.warn(e.logs);
                }
            }
            throw e;
        }
    });
});
