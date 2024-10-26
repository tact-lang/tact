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
                const anotherAddr = randomAddress(
                    0,
                    "anotherAddr-" + k.toString(10),
                );
                const valueCell = beginCell().storeUint(123123, 128).endCell();
                const valueStruct: SomeStruct = {
                    $$type: "SomeStruct",
                    value: 10012312n,
                };
                const anotherValueStruct: SomeStruct = {
                    $$type: "SomeStruct",
                    value: 123n,
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

                // Tests for intMap1
                expect(await contract.getIntMap1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Tests for intMap2
                expect(await contract.getIntMap2Replace(k, null)).toBe(true);
                expect(await contract.getIntMap2Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap2Replace(k, true)).toBe(true);
                expect(await contract.getIntMap2Replace(k + 1n, true)).toBe(
                    false,
                );

                // Tests for intMap3
                expect(await contract.getIntMap3Replace(k, null)).toBe(true);
                expect(await contract.getIntMap3Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap3Replace(k, valueCell)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap3Replace(k + 1n, valueCell),
                ).toBe(false);

                // Tests for intMap4
                expect(await contract.getIntMap4Replace(k, null)).toBe(true);
                expect(await contract.getIntMap4Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(
                    await contract.getIntMap4Replace(k, anotherValueStruct),
                ).toBe(true);
                expect(
                    await contract.getIntMap4Replace(
                        k + 1n,
                        anotherValueStruct,
                    ),
                ).toBe(false);

                // Tests for intMap5
                expect(await contract.getIntMap5Replace(k, null)).toBe(true);
                expect(await contract.getIntMap5Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap5Replace(k, addr)).toBe(true);
                expect(await contract.getIntMap5Replace(k + 1n, addr)).toBe(
                    false,
                );

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(await contract.getIntMap6_1Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_1Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_1Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_1Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_2Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_2Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_2Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_2Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_3Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_3Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_3Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_3Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_4Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_4Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_4Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_4Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_5Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_5Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_5Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_5Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_6Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_6Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_6Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_6Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_7Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_7Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_7Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_7Replace(keySmall + 1n, 123n),
                ).toBe(false);

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                // Tests for intMap8 (maps with signed value types)
                expect(await contract.getIntMap8_1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_2Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_2Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_2Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_2Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_3Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_3Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_3Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_3Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_4Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_4Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_4Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_4Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_5Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_5Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_5Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_5Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_6Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_6Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_6Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_6Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_7Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_7Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_7Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_7Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Tests for intMap9 (maps with unsigned value types)
                expect(await contract.getIntMap9_1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_2Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_2Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_2Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_2Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_3Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_3Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_3Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_3Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_4Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_4Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_4Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_4Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_5Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_5Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_5Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_5Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_6Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_6Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_6Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_6Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                // Tests for addrMap1
                expect(await contract.getAddrMap1Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap1Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap1Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap1Replace(anotherAddr, 123n),
                ).toBe(false);

                // Tests for addrMap2
                expect(await contract.getAddrMap2Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap2Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap2Replace(addr, true)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap2Replace(anotherAddr, true),
                ).toBe(false);

                // Tests for addrMap3
                expect(await contract.getAddrMap3Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap3Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap3Replace(addr, valueCell)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap3Replace(anotherAddr, valueCell),
                ).toBe(false);

                // Tests for addrMap4
                expect(await contract.getAddrMap4Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap4Replace(anotherAddr, null),
                ).toBe(false);
                expect(
                    await contract.getAddrMap4Replace(addr, anotherValueStruct),
                ).toBe(true);
                expect(
                    await contract.getAddrMap4Replace(
                        anotherAddr,
                        anotherValueStruct,
                    ),
                ).toBe(false);

                // Tests for addrMap5
                expect(await contract.getAddrMap5Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap5Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap5Replace(addr, addr)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap5Replace(anotherAddr, addr),
                ).toBe(false);

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_1Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_1Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_1Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_2Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_2Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_2Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_2Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_3Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_3Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_3Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_3Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_4Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_4Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_4Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_4Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_5Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_5Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_5Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_5Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_6Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_6Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_6Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_6Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_7Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_7Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_7Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_7Replace(anotherAddr, 123n),
                ).toBe(false);

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_1Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_1Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_1Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_2Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_2Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_2Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_2Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_3Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_3Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_3Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_3Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_4Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_4Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_4Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_4Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_5Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_5Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_5Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_5Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_6Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_6Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_6Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_6Replace(anotherAddr, 123n),
                ).toBe(false);

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

                // Check that .replace still returns same values

                // Tests for intMap1
                expect(await contract.getIntMap1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Tests for intMap2
                expect(await contract.getIntMap2Replace(k, null)).toBe(true);
                expect(await contract.getIntMap2Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap2Replace(k, true)).toBe(true);
                expect(await contract.getIntMap2Replace(k + 1n, true)).toBe(
                    false,
                );

                // Tests for intMap3
                expect(await contract.getIntMap3Replace(k, null)).toBe(true);
                expect(await contract.getIntMap3Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap3Replace(k, valueCell)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap3Replace(k + 1n, valueCell),
                ).toBe(false);

                // Tests for intMap4
                expect(await contract.getIntMap4Replace(k, null)).toBe(true);
                expect(await contract.getIntMap4Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(
                    await contract.getIntMap4Replace(k, anotherValueStruct),
                ).toBe(true);
                expect(
                    await contract.getIntMap4Replace(
                        k + 1n,
                        anotherValueStruct,
                    ),
                ).toBe(false);

                // Tests for intMap5
                expect(await contract.getIntMap5Replace(k, null)).toBe(true);
                expect(await contract.getIntMap5Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap5Replace(k, addr)).toBe(true);
                expect(await contract.getIntMap5Replace(k + 1n, addr)).toBe(
                    false,
                );

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(await contract.getIntMap6_1Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_1Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_1Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_1Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_2Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_2Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_2Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_2Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_3Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_3Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_3Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_3Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_4Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_4Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_4Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_4Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_5Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_5Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_5Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_5Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_6Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_6Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_6Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_6Replace(keySmall + 1n, 123n),
                ).toBe(false);

                expect(await contract.getIntMap6_7Replace(keySmall, null)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_7Replace(keySmall + 1n, null),
                ).toBe(false);
                expect(await contract.getIntMap6_7Replace(keySmall, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getIntMap6_7Replace(keySmall + 1n, 123n),
                ).toBe(false);

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                // Tests for intMap8 (maps with signed value types)
                expect(await contract.getIntMap8_1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_2Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_2Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_2Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_2Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_3Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_3Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_3Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_3Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_4Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_4Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_4Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_4Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_5Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_5Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_5Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_5Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_6Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_6Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_6Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_6Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap8_7Replace(k, null)).toBe(true);
                expect(await contract.getIntMap8_7Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap8_7Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap8_7Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Tests for intMap9 (maps with unsigned value types)
                expect(await contract.getIntMap9_1Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_1Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_1Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_1Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_2Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_2Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_2Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_2Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_3Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_3Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_3Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_3Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_4Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_4Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_4Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_4Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_5Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_5Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_5Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_5Replace(k + 1n, 123n)).toBe(
                    false,
                );

                expect(await contract.getIntMap9_6Replace(k, null)).toBe(true);
                expect(await contract.getIntMap9_6Replace(k + 1n, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap9_6Replace(k, 123n)).toBe(true);
                expect(await contract.getIntMap9_6Replace(k + 1n, 123n)).toBe(
                    false,
                );

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, null),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs + 1n, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, 123n),
                ).toBe(true);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs + 1n, 123n),
                ).toBe(false);

                // Tests for addrMap1
                expect(await contract.getAddrMap1Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap1Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap1Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap1Replace(anotherAddr, 123n),
                ).toBe(false);

                // Tests for addrMap2
                expect(await contract.getAddrMap2Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap2Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap2Replace(addr, true)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap2Replace(anotherAddr, true),
                ).toBe(false);

                // Tests for addrMap3
                expect(await contract.getAddrMap3Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap3Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap3Replace(addr, valueCell)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap3Replace(anotherAddr, valueCell),
                ).toBe(false);

                // Tests for addrMap4
                expect(await contract.getAddrMap4Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap4Replace(anotherAddr, null),
                ).toBe(false);
                expect(
                    await contract.getAddrMap4Replace(addr, anotherValueStruct),
                ).toBe(true);
                expect(
                    await contract.getAddrMap4Replace(
                        anotherAddr,
                        anotherValueStruct,
                    ),
                ).toBe(false);

                // Tests for addrMap5
                expect(await contract.getAddrMap5Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap5Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap5Replace(addr, addr)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap5Replace(anotherAddr, addr),
                ).toBe(false);

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_1Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_1Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_1Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_2Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_2Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_2Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_2Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_3Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_3Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_3Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_3Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_4Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_4Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_4Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_4Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_5Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_5Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_5Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_5Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_6Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_6Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_6Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_6Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap6_7Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_7Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap6_7Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap6_7Replace(anotherAddr, 123n),
                ).toBe(false);

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_1Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_1Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_1Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_2Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_2Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_2Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_2Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_3Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_3Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_3Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_3Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_4Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_4Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_4Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_4Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_5Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_5Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_5Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_5Replace(anotherAddr, 123n),
                ).toBe(false);

                expect(await contract.getAddrMap7_6Replace(addr, null)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_6Replace(anotherAddr, null),
                ).toBe(false);
                expect(await contract.getAddrMap7_6Replace(addr, 123n)).toBe(
                    true,
                );
                expect(
                    await contract.getAddrMap7_6Replace(anotherAddr, 123n),
                ).toBe(false);

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

                // Check that .replace returns false for cleared keys

                // Tests for intMap1
                expect(await contract.getIntMap1Replace(k, null)).toBe(false);
                expect(await contract.getIntMap1Replace(k, 123n)).toBe(false);

                // Tests for intMap2
                expect(await contract.getIntMap2Replace(k, null)).toBe(false);
                expect(await contract.getIntMap2Replace(k, true)).toBe(false);

                // Tests for intMap3
                expect(await contract.getIntMap3Replace(k, null)).toBe(false);
                expect(await contract.getIntMap3Replace(k, valueCell)).toBe(
                    false,
                );

                // Tests for intMap4
                expect(await contract.getIntMap4Replace(k, null)).toBe(false);
                expect(
                    await contract.getIntMap4Replace(k, anotherValueStruct),
                ).toBe(false);

                // Tests for intMap5
                expect(await contract.getIntMap5Replace(k, null)).toBe(false);
                expect(await contract.getIntMap5Replace(k, addr)).toBe(false);

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(await contract.getIntMap6_1Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_1Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_2Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_2Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_3Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_3Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_4Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_4Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_5Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_5Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_6Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_6Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_7Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_7Replace(keySmall, 123n)).toBe(
                    false,
                );

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, 123n),
                ).toBe(false);

                // Tests for intMap8 (maps with signed value types)
                expect(await contract.getIntMap8_1Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_1Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_2Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_2Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_3Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_3Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_4Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_4Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_5Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_5Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_6Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_6Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_7Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_7Replace(k, 123n)).toBe(false);

                // Tests for intMap9 (maps with unsigned value types)
                expect(await contract.getIntMap9_1Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_1Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_2Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_2Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_3Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_3Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_4Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_4Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_5Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_5Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_6Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_6Replace(k, 123n)).toBe(false);

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, 123n),
                ).toBe(false);

                // Tests for addrMap1
                expect(await contract.getAddrMap1Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap1Replace(addr, 123n)).toBe(
                    false,
                );

                // Tests for addrMap2
                expect(await contract.getAddrMap2Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap2Replace(addr, true)).toBe(
                    false,
                );

                // Tests for addrMap3
                expect(await contract.getAddrMap3Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap3Replace(addr, valueCell)).toBe(
                    false,
                );

                // Tests for addrMap4
                expect(await contract.getAddrMap4Replace(addr, null)).toBe(
                    false,
                );
                expect(
                    await contract.getAddrMap4Replace(addr, anotherValueStruct),
                ).toBe(false);

                // Tests for addrMap5
                expect(await contract.getAddrMap5Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap5Replace(addr, addr)).toBe(
                    false,
                );

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_1Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_2Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_2Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_3Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_3Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_4Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_4Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_5Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_5Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_6Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_6Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_7Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_7Replace(addr, 123n)).toBe(
                    false,
                );

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_1Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_2Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_2Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_3Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_3Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_4Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_4Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_5Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_5Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_6Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_6Replace(addr, 123n)).toBe(
                    false,
                );

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

                // Check that .replace still returns false for non-existing keys

                // Tests for intMap1
                expect(await contract.getIntMap1Replace(k, null)).toBe(false);
                expect(await contract.getIntMap1Replace(k, 123n)).toBe(false);

                // Tests for intMap2
                expect(await contract.getIntMap2Replace(k, null)).toBe(false);
                expect(await contract.getIntMap2Replace(k, true)).toBe(false);

                // Tests for intMap3
                expect(await contract.getIntMap3Replace(k, null)).toBe(false);
                expect(await contract.getIntMap3Replace(k, valueCell)).toBe(
                    false,
                );

                // Tests for intMap4
                expect(await contract.getIntMap4Replace(k, null)).toBe(false);
                expect(
                    await contract.getIntMap4Replace(k, anotherValueStruct),
                ).toBe(false);

                // Tests for intMap5
                expect(await contract.getIntMap5Replace(k, null)).toBe(false);
                expect(await contract.getIntMap5Replace(k, addr)).toBe(false);

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(await contract.getIntMap6_1Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_1Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_2Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_2Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_3Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_3Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_4Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_4Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_5Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_5Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_6Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_6Replace(keySmall, 123n)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_7Replace(keySmall, null)).toBe(
                    false,
                );
                expect(await contract.getIntMap6_7Replace(keySmall, 123n)).toBe(
                    false,
                );

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_1Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_2Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_3Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_4Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_5Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap7_6Replace(keySmallAbs, 123n),
                ).toBe(false);

                // Tests for intMap8 (maps with signed value types)
                expect(await contract.getIntMap8_1Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_1Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_2Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_2Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_3Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_3Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_4Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_4Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_5Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_5Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_6Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_6Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap8_7Replace(k, null)).toBe(false);
                expect(await contract.getIntMap8_7Replace(k, 123n)).toBe(false);

                // Tests for intMap9 (maps with unsigned value types)
                expect(await contract.getIntMap9_1Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_1Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_2Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_2Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_3Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_3Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_4Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_4Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_5Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_5Replace(k, 123n)).toBe(false);
                expect(await contract.getIntMap9_6Replace(k, null)).toBe(false);
                expect(await contract.getIntMap9_6Replace(k, 123n)).toBe(false);

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_1Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_2Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_3Replace(keySmallAbs, 123n),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, null),
                ).toBe(false);
                expect(
                    await contract.getIntMap10_4Replace(keySmallAbs, 123n),
                ).toBe(false);

                // Tests for addrMap1
                expect(await contract.getAddrMap1Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap1Replace(addr, 123n)).toBe(
                    false,
                );

                // Tests for addrMap2
                expect(await contract.getAddrMap2Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap2Replace(addr, true)).toBe(
                    false,
                );

                // Tests for addrMap3
                expect(await contract.getAddrMap3Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap3Replace(addr, valueCell)).toBe(
                    false,
                );

                // Tests for addrMap4
                expect(await contract.getAddrMap4Replace(addr, null)).toBe(
                    false,
                );
                expect(
                    await contract.getAddrMap4Replace(addr, anotherValueStruct),
                ).toBe(false);

                // Tests for addrMap5
                expect(await contract.getAddrMap5Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap5Replace(addr, addr)).toBe(
                    false,
                );

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_1Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_2Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_2Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_3Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_3Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_4Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_4Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_5Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_5Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_6Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_6Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_7Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap6_7Replace(addr, 123n)).toBe(
                    false,
                );

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_1Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_2Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_2Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_3Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_3Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_4Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_4Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_5Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_5Replace(addr, 123n)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_6Replace(addr, null)).toBe(
                    false,
                );
                expect(await contract.getAddrMap7_6Replace(addr, 123n)).toBe(
                    false,
                );
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
                const anotherAddr = randomAddress(
                    0,
                    "anotherAddr-" + k.toString(10),
                );
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

                // Tests for intMap1
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

                // Tests for intMap2
                expect(await contract.getIntMap2ReplaceGet(k, null)).toBe(
                    valueBool,
                );
                expect(await contract.getIntMap2ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap2ReplaceGet(k, true)).toBe(
                    valueBool,
                );
                expect(await contract.getIntMap2ReplaceGet(k + 1n, true)).toBe(
                    null,
                );

                // Tests for intMap3
                expect(
                    await contract.getIntMap3ReplaceGet(k, null),
                ).toEqualCell(valueCell);
                expect(await contract.getIntMap3ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(
                    await contract.getIntMap3ReplaceGet(k, valueCell),
                ).toEqualCell(valueCell);
                expect(
                    await contract.getIntMap3ReplaceGet(k + 1n, valueCell),
                ).toBe(null);

                // Tests for intMap4
                expect(
                    strEq(
                        (await contract.getIntMap4ReplaceGet(k, null))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(await contract.getIntMap4ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(
                    strEq(
                        (await contract.getIntMap4ReplaceGet(k, valueStruct))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    await contract.getIntMap4ReplaceGet(k + 1n, valueStruct),
                ).toBe(null);

                // Tests for intMap5
                expect(
                    (await contract.getIntMap5ReplaceGet(k, null))!.equals(
                        valueAddr,
                    ),
                ).toBe(true);
                expect(await contract.getIntMap5ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(
                    (await contract.getIntMap5ReplaceGet(k, valueAddr))!.equals(
                        valueAddr,
                    ),
                ).toBe(true);
                expect(
                    await contract.getIntMap5ReplaceGet(k + 1n, valueAddr),
                ).toBe(null);

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_1ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_1ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_2ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_2ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_3ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_3ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_4ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_4ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_5ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_5ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_6ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt);
                expect(
                    await contract.getIntMap7_6ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_1ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_1ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_2ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_2ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_3ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_3ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_4ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs);
                expect(
                    await contract.getIntMap10_4ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                // Tests for addrMap1
                expect(await contract.getAddrMap1ReplaceGet(addr, null)).toBe(
                    valueInt,
                );
                expect(
                    await contract.getAddrMap1ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap1ReplaceGet(addr, 123n)).toBe(
                    valueInt,
                );
                expect(
                    await contract.getAddrMap1ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                // Tests for addrMap2
                expect(await contract.getAddrMap2ReplaceGet(addr, null)).toBe(
                    valueBool,
                );
                expect(
                    await contract.getAddrMap2ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap2ReplaceGet(addr, true)).toBe(
                    valueBool,
                );
                expect(
                    await contract.getAddrMap2ReplaceGet(anotherAddr, true),
                ).toBe(null);

                // Tests for addrMap3
                expect(
                    await contract.getAddrMap3ReplaceGet(addr, null),
                ).toEqualCell(valueCell);
                expect(
                    await contract.getAddrMap3ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(
                    await contract.getAddrMap3ReplaceGet(addr, valueCell),
                ).toEqualCell(valueCell);
                expect(
                    await contract.getAddrMap3ReplaceGet(
                        anotherAddr,
                        valueCell,
                    ),
                ).toBe(null);

                // Tests for addrMap4
                expect(
                    strEq(
                        (await contract.getAddrMap4ReplaceGet(addr, null))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap4ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(
                    strEq(
                        (await contract.getAddrMap4ReplaceGet(
                            addr,
                            valueStruct,
                        ))!,
                        valueStruct,
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap4ReplaceGet(
                        anotherAddr,
                        valueStruct,
                    ),
                ).toBe(null);

                // Tests for addrMap5
                expect(
                    (await contract.getAddrMap5ReplaceGet(addr, null))!.equals(
                        valueAddr,
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap5ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(
                    (await contract.getAddrMap5ReplaceGet(
                        addr,
                        valueAddr,
                    ))!.equals(valueAddr),
                ).toBe(true);
                expect(
                    await contract.getAddrMap5ReplaceGet(
                        anotherAddr,
                        valueAddr,
                    ),
                ).toBe(null);

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_1ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_1ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_1ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_2ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_2ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_2ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_2ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_3ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_3ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_3ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_3ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_4ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_4ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_4ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_4ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_5ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_5ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_5ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_5ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_6ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_6ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_6ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_6ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_7ReplaceGet(addr, null)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_7ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_7ReplaceGet(addr, 123n)).toBe(
                    valueSmall,
                );
                expect(
                    await contract.getAddrMap6_7ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1ReplaceGet(addr, null)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_1ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_1ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_1ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_2ReplaceGet(addr, null)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_2ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_2ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_2ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_3ReplaceGet(addr, null)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_3ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_3ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_3ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_4ReplaceGet(addr, null)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_4ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_4ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_4ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_5ReplaceGet(addr, null)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_5ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_5ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_5ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_6ReplaceGet(addr, null)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_6ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_6ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs,
                );
                expect(
                    await contract.getAddrMap7_6ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

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

                // Check that .replaceGet returns new replaced values
                // Tests for intMap1
                expect(await contract.getIntMap1ReplaceGet(k, null)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap1ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap1ReplaceGet(k, 123n)).toBe(
                    valueInt + 1n,
                );
                expect(await contract.getIntMap1ReplaceGet(k + 1n, 123n)).toBe(
                    null,
                );

                // Tests for intMap2
                expect(await contract.getIntMap2ReplaceGet(k, null)).toBe(
                    !valueBool,
                );
                expect(await contract.getIntMap2ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap2ReplaceGet(k, true)).toBe(
                    !valueBool,
                );
                expect(await contract.getIntMap2ReplaceGet(k + 1n, true)).toBe(
                    null,
                );

                // Tests for intMap3
                expect(
                    (await contract.getIntMap3ReplaceGet(k, null))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(await contract.getIntMap3ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(
                    (await contract.getIntMap3ReplaceGet(k, valueCell))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    await contract.getIntMap3ReplaceGet(k + 1n, valueCell),
                ).toBe(null);

                // Tests for intMap4
                expect(
                    strEq((await contract.getIntMap4ReplaceGet(k, null))!, {
                        $$type: "SomeStruct",
                        value: 10012312n + 1n,
                    }),
                ).toBe(true);
                expect(await contract.getIntMap4ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(
                    strEq(
                        (await contract.getIntMap4ReplaceGet(k, valueStruct))!,
                        {
                            $$type: "SomeStruct",
                            value: 10012312n + 1n,
                        },
                    ),
                ).toBe(true);
                expect(
                    await contract.getIntMap4ReplaceGet(k + 1n, valueStruct),
                ).toBe(null);

                // Tests for intMap5
                expect(
                    (await contract.getIntMap5ReplaceGet(k, null))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(await contract.getIntMap5ReplaceGet(k + 1n, null)).toBe(
                    null,
                );
                expect(
                    (await contract.getIntMap5ReplaceGet(k, valueAddr))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(
                    await contract.getIntMap5ReplaceGet(k + 1n, valueAddr),
                ).toBe(null);

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall + 1n, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall + 1n, 123n),
                ).toBe(null);

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_1ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_1ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_2ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_2ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_3ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_3ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_4ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_4ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_5ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_5ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, null),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_6ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueInt + 1n);
                expect(
                    await contract.getIntMap7_6ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                // Tests for intMap8 (signed small values)
                expect(await contract.getIntMap8_1ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_1ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_1ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_1ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap8_2ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_2ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_2ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_2ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap8_3ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_3ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_3ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_3ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap8_4ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_4ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_4ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_4ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap8_5ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_5ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_5ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_5ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap8_6ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_6ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_6ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_6ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap8_7ReplaceGet(k, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_7ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap8_7ReplaceGet(k, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getIntMap8_7ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                // Tests for intMap9 (unsigned small values)
                expect(await contract.getIntMap9_1ReplaceGet(k, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_1ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap9_1ReplaceGet(k, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_1ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap9_2ReplaceGet(k, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_2ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap9_2ReplaceGet(k, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_2ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap9_3ReplaceGet(k, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_3ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap9_3ReplaceGet(k, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_3ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap9_4ReplaceGet(k, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_4ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap9_4ReplaceGet(k, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_4ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap9_5ReplaceGet(k, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_5ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap9_5ReplaceGet(k, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_5ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                expect(await contract.getIntMap9_6ReplaceGet(k, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_6ReplaceGet(k + 1n, null),
                ).toBe(null);
                expect(await contract.getIntMap9_6ReplaceGet(k, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getIntMap9_6ReplaceGet(k + 1n, 123n),
                ).toBe(null);

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_1ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_1ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_2ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_2ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_3ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_3ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, null),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_4ReplaceGet(
                        keySmallAbs + 1n,
                        null,
                    ),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(valueSmallAbs + 1n);
                expect(
                    await contract.getIntMap10_4ReplaceGet(
                        keySmallAbs + 1n,
                        123n,
                    ),
                ).toBe(null);

                // Tests for addrMap1
                expect(await contract.getAddrMap1ReplaceGet(addr, null)).toBe(
                    valueInt + 1n,
                );
                expect(
                    await contract.getAddrMap1ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap1ReplaceGet(addr, 123n)).toBe(
                    valueInt + 1n,
                );
                expect(
                    await contract.getAddrMap1ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                // Tests for addrMap2
                expect(await contract.getAddrMap2ReplaceGet(addr, null)).toBe(
                    !valueBool,
                );
                expect(
                    await contract.getAddrMap2ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap2ReplaceGet(addr, true)).toBe(
                    !valueBool,
                );
                expect(
                    await contract.getAddrMap2ReplaceGet(anotherAddr, true),
                ).toBe(null);

                // Tests for addrMap3
                expect(
                    (await contract.getAddrMap3ReplaceGet(addr, null))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap3ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(
                    (await contract.getAddrMap3ReplaceGet(
                        addr,
                        valueCell,
                    ))!.equals(
                        beginCell()
                            .storeUint(123, 64)
                            .storeRef(valueCell)
                            .endCell(),
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap3ReplaceGet(
                        anotherAddr,
                        valueCell,
                    ),
                ).toBe(null);

                // Tests for addrMap4
                expect(
                    strEq((await contract.getAddrMap4ReplaceGet(addr, null))!, {
                        $$type: "SomeStruct",
                        value: 10012312n + 1n,
                    }),
                ).toBe(true);
                expect(
                    await contract.getAddrMap4ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(
                    strEq(
                        (await contract.getAddrMap4ReplaceGet(
                            addr,
                            valueStruct,
                        ))!,
                        {
                            $$type: "SomeStruct",
                            value: 10012312n + 1n,
                        },
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap4ReplaceGet(
                        anotherAddr,
                        valueStruct,
                    ),
                ).toBe(null);

                // Tests for addrMap5
                expect(
                    (await contract.getAddrMap5ReplaceGet(addr, null))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap5ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(
                    (await contract.getAddrMap5ReplaceGet(
                        addr,
                        valueAddr,
                    ))!.equals(
                        randomAddress(0, "value-" + (k + 1n).toString(10)),
                    ),
                ).toBe(true);
                expect(
                    await contract.getAddrMap5ReplaceGet(
                        anotherAddr,
                        valueAddr,
                    ),
                ).toBe(null);

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_1ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_1ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_1ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_2ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_2ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_2ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_2ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_3ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_3ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_3ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_3ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_4ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_4ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_4ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_4ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_5ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_5ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_5ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_5ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_6ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_6ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_6ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_6ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap6_7ReplaceGet(addr, null)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_7ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap6_7ReplaceGet(addr, 123n)).toBe(
                    valueSmall + 1n,
                );
                expect(
                    await contract.getAddrMap6_7ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1ReplaceGet(addr, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_1ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_1ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_1ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_2ReplaceGet(addr, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_2ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_2ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_2ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_3ReplaceGet(addr, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_3ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_3ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_3ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_4ReplaceGet(addr, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_4ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_4ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_4ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_5ReplaceGet(addr, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_5ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_5ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_5ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

                expect(await contract.getAddrMap7_6ReplaceGet(addr, null)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_6ReplaceGet(anotherAddr, null),
                ).toBe(null);
                expect(await contract.getAddrMap7_6ReplaceGet(addr, 123n)).toBe(
                    valueSmallAbs + 1n,
                );
                expect(
                    await contract.getAddrMap7_6ReplaceGet(anotherAddr, 123n),
                ).toBe(null);

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

                // Check that .replaceGet returns false for cleared keys
                // Tests for intMap1
                expect(await contract.getIntMap1ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap1ReplaceGet(k, 123n)).toBe(null);

                // Tests for intMap2
                expect(await contract.getIntMap2ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap2ReplaceGet(k, true)).toBe(null);

                // Tests for intMap3
                expect(await contract.getIntMap3ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap3ReplaceGet(k, valueCell)).toBe(
                    null,
                );

                // Tests for intMap4
                expect(await contract.getIntMap4ReplaceGet(k, null)).toBe(null);
                expect(
                    await contract.getIntMap4ReplaceGet(k, valueStruct),
                ).toBe(null);

                // Tests for intMap5
                expect(await contract.getIntMap5ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap5ReplaceGet(k, valueAddr)).toBe(
                    null,
                );

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, 123n),
                ).toBe(null);

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                // Tests for intMap8 (signed small values)
                expect(await contract.getIntMap8_1ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_2ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_2ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_3ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_3ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_4ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_4ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_5ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_5ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_6ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_6ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_7ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_7ReplaceGet(k, 123n)).toBe(
                    null,
                );

                // Tests for intMap9 (unsigned small values)
                expect(await contract.getIntMap9_1ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_1ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_2ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_2ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_3ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_3ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_4ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_4ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_5ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_5ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_6ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_6ReplaceGet(k, 123n)).toBe(
                    null,
                );

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                // Tests for addrMap1
                expect(await contract.getAddrMap1ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                // Tests for addrMap2
                expect(await contract.getAddrMap2ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap2ReplaceGet(addr, true)).toBe(
                    null,
                );

                // Tests for addrMap3
                expect(await contract.getAddrMap3ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(
                    await contract.getAddrMap3ReplaceGet(addr, valueCell),
                ).toBe(null);

                // Tests for addrMap4
                expect(await contract.getAddrMap4ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(
                    await contract.getAddrMap4ReplaceGet(addr, valueStruct),
                ).toBe(null);

                // Tests for addrMap5
                expect(await contract.getAddrMap5ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(
                    await contract.getAddrMap5ReplaceGet(addr, valueAddr),
                ).toBe(null);

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_1ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_2ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_2ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_3ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_3ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_4ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_4ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_5ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_5ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_6ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_6ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_7ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_7ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_1ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_2ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_2ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_3ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_3ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_4ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_4ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_5ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_5ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_6ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_6ReplaceGet(addr, 123n)).toBe(
                    null,
                );

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

                // Check that .replaceGet still returns false for non-existing keys
                // Tests for intMap1
                expect(await contract.getIntMap1ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap1ReplaceGet(k, 123n)).toBe(null);

                // Tests for intMap2
                expect(await contract.getIntMap2ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap2ReplaceGet(k, true)).toBe(null);

                // Tests for intMap3
                expect(await contract.getIntMap3ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap3ReplaceGet(k, valueCell)).toBe(
                    null,
                );

                // Tests for intMap4
                expect(await contract.getIntMap4ReplaceGet(k, null)).toBe(null);
                expect(
                    await contract.getIntMap4ReplaceGet(k, valueStruct),
                ).toBe(null);

                // Tests for intMap5
                expect(await contract.getIntMap5ReplaceGet(k, null)).toBe(null);
                expect(await contract.getIntMap5ReplaceGet(k, valueAddr)).toBe(
                    null,
                );

                // Tests for intMap6 (signed integer maps of various sizes)
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_1ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_2ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_3ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_4ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_5ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_6ReplaceGet(keySmall, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap6_7ReplaceGet(keySmall, 123n),
                ).toBe(null);

                // Tests for intMap7 (unsigned integer maps of various sizes)
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_5ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap7_6ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                // Tests for intMap8 (signed small values)
                expect(await contract.getIntMap8_1ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_1ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_2ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_2ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_3ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_3ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_4ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_4ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_5ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_5ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_6ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_6ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap8_7ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap8_7ReplaceGet(k, 123n)).toBe(
                    null,
                );

                // Tests for intMap9 (unsigned small values)
                expect(await contract.getIntMap9_1ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_1ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_2ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_2ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_3ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_3ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_4ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_4ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_5ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_5ReplaceGet(k, 123n)).toBe(
                    null,
                );

                expect(await contract.getIntMap9_6ReplaceGet(k, null)).toBe(
                    null,
                );
                expect(await contract.getIntMap9_6ReplaceGet(k, 123n)).toBe(
                    null,
                );

                // Tests for intMap10 (custom-sized integer pairings)
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_1ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_2ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_3ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, null),
                ).toBe(null);
                expect(
                    await contract.getIntMap10_4ReplaceGet(keySmallAbs, 123n),
                ).toBe(null);

                // Tests for addrMap1
                expect(await contract.getAddrMap1ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap1ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                // Tests for addrMap2
                expect(await contract.getAddrMap2ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap2ReplaceGet(addr, true)).toBe(
                    null,
                );

                // Tests for addrMap3
                expect(await contract.getAddrMap3ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(
                    await contract.getAddrMap3ReplaceGet(addr, valueCell),
                ).toBe(null);

                // Tests for addrMap4
                expect(await contract.getAddrMap4ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(
                    await contract.getAddrMap4ReplaceGet(addr, valueStruct),
                ).toBe(null);

                // Tests for addrMap5
                expect(await contract.getAddrMap5ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(
                    await contract.getAddrMap5ReplaceGet(addr, valueAddr),
                ).toBe(null);

                // Tests for addrMap6 (signed int value types with address keys)
                expect(await contract.getAddrMap6_1ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_1ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_2ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_2ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_3ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_3ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_4ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_4ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_5ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_5ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_6ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_6ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap6_7ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap6_7ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                // Tests for addrMap7 (unsigned int value types with address keys)
                expect(await contract.getAddrMap7_1ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_1ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_2ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_2ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_3ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_3ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_4ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_4ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_5ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_5ReplaceGet(addr, 123n)).toBe(
                    null,
                );

                expect(await contract.getAddrMap7_6ReplaceGet(addr, null)).toBe(
                    null,
                );
                expect(await contract.getAddrMap7_6ReplaceGet(addr, 123n)).toBe(
                    null,
                );
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
