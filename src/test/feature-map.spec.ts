import { randomAddress } from './utils/randomAddress';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { MapTestContract, SomeStruct } from './features/output/maps_MapTestContract';
import { ContractSystem } from '@tact-lang/emulator';
import { beginCell, toNano } from '@ton/core';
import { ComputeError } from '@ton/core';

function strEq(a: SomeStruct | null, b: SomeStruct | null) {
    if (a === null || b === null) {
        return a === b;
    }
    return a.value === b.value;
}

describe('feature-map', () => {
    /* eslint-disable */
    let globalCoverage: any;
    beforeAll(() => {
        globalCoverage = (globalThis as any).__ton_coverage__;
        delete (globalThis as any).__ton_coverage__;
    });
    afterAll(() => {
        (globalThis as any).__ton_coverage__ = globalCoverage;
    })
    /* eslint-enable */
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement maps correctly', async () => {
        jest.setTimeout(2 * 60000);
        try {

            // Init contract
            const system = await ContractSystem.create();
            const treasure = system.treasure('treasure');
            const contract = system.open(await MapTestContract.fromInit());
            await contract.send(treasure, { value: toNano('10') }, null);
            await system.run();

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
                const addr = randomAddress(0, 'addr-' + k.toString(10));
                const valueCell = beginCell().storeUint(123123, 128).endCell();
                const valueStruct: SomeStruct = { $$type: 'SomeStruct', value: 10012312n };
                const valueAddr = randomAddress(0, 'value-' + k.toString(10));
                const keySmall = k % 100n;
                const keySmallAbs = (k > 0 ? k : -k) % 100n;
                const valueSmall = k % 100n;
                const valueSmallAbs = (k > 0 ? k : -k) % 100n;
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap1', key: k, value: valueInt });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap2', key: k, value: valueBool });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap3', key: k, value: valueCell });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap4', key: k, value: valueStruct });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap5', key: k, value: valueAddr });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap6', key: keySmall, value: valueInt });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetUIntMap7', key: keySmallAbs, value: valueInt });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap8', key: k, value: valueSmall });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetUIntMap9', key: k, value: valueSmallAbs });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap1', key: addr, value: valueInt });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap2', key: addr, value: valueBool });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap3', key: addr, value: valueCell });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap4', key: addr, value: valueStruct });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap5', key: addr, value: valueAddr });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap6', key: addr, value: valueSmall });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap7', key: addr, value: valueSmallAbs });
                await system.run();

                // Check value set
                expect((await contract.getIntMap1Value(k))).toBe(valueInt);
                expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
                expect((await contract.getIntMap3Value(k))!.equals(valueCell)).toBe(true);
                expect(strEq((await contract.getIntMap4Value(k))!, valueStruct)).toBe(true);
                expect((await contract.getIntMap5Value(k))!.equals(valueAddr)).toBe(true);
                expect((await contract.getIntMap6_1Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap6_2Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap6_3Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap6_4Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap6_5Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap6_6Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap6_7Value(keySmall))).toBe(valueInt);
                expect((await contract.getIntMap7_1Value(keySmallAbs))).toBe(valueInt);
                expect((await contract.getIntMap7_2Value(keySmallAbs))).toBe(valueInt);
                expect((await contract.getIntMap7_3Value(keySmallAbs))).toBe(valueInt);
                expect((await contract.getIntMap7_4Value(keySmallAbs))).toBe(valueInt);
                expect((await contract.getIntMap7_5Value(keySmallAbs))).toBe(valueInt);
                expect((await contract.getIntMap7_6Value(keySmallAbs))).toBe(valueInt);
                expect((await contract.getIntMap8_1Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap8_2Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap8_3Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap8_4Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap8_5Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap8_6Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap8_7Value(k))).toBe(valueSmall);
                expect((await contract.getIntMap9_1Value(k))).toBe(valueSmallAbs);
                expect((await contract.getIntMap9_2Value(k))).toBe(valueSmallAbs);
                expect((await contract.getIntMap9_3Value(k))).toBe(valueSmallAbs);
                expect((await contract.getIntMap9_4Value(k))).toBe(valueSmallAbs);
                expect((await contract.getIntMap9_5Value(k))).toBe(valueSmallAbs);
                expect((await contract.getIntMap9_6Value(k))).toBe(valueSmallAbs);
                expect((await contract.getIntMap10Value(keySmall, valueInt))).toBe(valueInt * 7n);
                expect((await contract.getIntMap11Value(keySmallAbs, valueInt))).toBe(valueInt * 6n);
                expect((await contract.getIntMap12Value(k, valueSmall))).toBe(valueSmall * 7n);
                expect((await contract.getIntMap13Value(k, valueSmallAbs))).toBe(valueSmallAbs * 7n);
                expect((await contract.getAddrMap1Value(addr))).toBe(valueInt);
                expect((await contract.getAddrMap2Value(addr))!).toBe(valueBool);
                expect((await contract.getAddrMap3Value(addr))!.equals(valueCell)).toBe(true);
                expect(strEq((await contract.getAddrMap4Value(addr))!, valueStruct)).toBe(true);
                expect((await contract.getAddrMap5Value(addr))!.equals(valueAddr)).toBe(true);
                expect((await contract.getAddrMap6_1Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap6_2Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap6_3Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap6_4Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap6_5Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap6_6Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap6_7Value(addr))).toBe(valueSmall);
                expect((await contract.getAddrMap7_1Value(addr))).toBe(valueSmallAbs);
                expect((await contract.getAddrMap7_2Value(addr))).toBe(valueSmallAbs);
                expect((await contract.getAddrMap7_3Value(addr))).toBe(valueSmallAbs);
                expect((await contract.getAddrMap7_4Value(addr))).toBe(valueSmallAbs);
                expect((await contract.getAddrMap7_5Value(addr))).toBe(valueSmallAbs);
                expect((await contract.getAddrMap7_6Value(addr))).toBe(valueSmallAbs);

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
                expect((await contract.getAddrMap1()).size).toBe(1);
                expect((await contract.getAddrMap2()).size).toBe(1);
                expect((await contract.getAddrMap3()).size).toBe(1);
                expect((await contract.getAddrMap4()).size).toBe(1);

                // Clear keys
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap1', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap2', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap3', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap4', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap5', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap6', key: keySmall, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetUIntMap7', key: keySmallAbs, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap8', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetUIntMap9', key: k, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap1', key: addr, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap2', key: addr, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap3', key: addr, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap4', key: addr, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap5', key: addr, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap6', key: addr, value: null });
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap7', key: addr, value: null });
                await system.run();

                // Check value cleared
                expect((await contract.getIntMap1Value(k))).toBeNull();
                expect((await contract.getIntMap2Value(k))).toBeNull();
                expect((await contract.getIntMap3Value(k))).toBeNull();
                expect((await contract.getIntMap4Value(k))).toBeNull();
                expect((await contract.getIntMap5Value(k))).toBeNull();
                expect((await contract.getIntMap6_1Value(keySmall))).toBe(null);
                expect((await contract.getIntMap6_2Value(keySmall))).toBe(null);
                expect((await contract.getIntMap6_3Value(keySmall))).toBe(null);
                expect((await contract.getIntMap6_4Value(keySmall))).toBe(null);
                expect((await contract.getIntMap6_5Value(keySmall))).toBe(null);
                expect((await contract.getIntMap6_6Value(keySmall))).toBe(null);
                expect((await contract.getIntMap6_7Value(keySmall))).toBe(null);
                expect((await contract.getIntMap7_1Value(keySmallAbs))).toBe(null);
                expect((await contract.getIntMap7_2Value(keySmallAbs))).toBe(null);
                expect((await contract.getIntMap7_3Value(keySmallAbs))).toBe(null);
                expect((await contract.getIntMap7_4Value(keySmallAbs))).toBe(null);
                expect((await contract.getIntMap7_5Value(keySmallAbs))).toBe(null);
                expect((await contract.getIntMap7_6Value(keySmallAbs))).toBe(null);
                expect((await contract.getIntMap8_1Value(k))).toBe(null);
                expect((await contract.getIntMap8_2Value(k))).toBe(null);
                expect((await contract.getIntMap8_3Value(k))).toBe(null);
                expect((await contract.getIntMap8_4Value(k))).toBe(null);
                expect((await contract.getIntMap8_5Value(k))).toBe(null);
                expect((await contract.getIntMap8_6Value(k))).toBe(null);
                expect((await contract.getIntMap8_7Value(k))).toBe(null);
                expect((await contract.getIntMap9_1Value(k))).toBe(null);
                expect((await contract.getIntMap9_2Value(k))).toBe(null);
                expect((await contract.getIntMap9_3Value(k))).toBe(null);
                expect((await contract.getIntMap9_4Value(k))).toBe(null);
                expect((await contract.getIntMap9_5Value(k))).toBe(null);
                expect((await contract.getIntMap9_6Value(k))).toBe(null);
                expect((await contract.getAddrMap1Value(addr))).toBeNull();
                expect((await contract.getAddrMap2Value(addr))).toBeNull();
                expect((await contract.getAddrMap3Value(addr))).toBeNull();
                expect((await contract.getAddrMap4Value(addr))).toBeNull();
                expect((await contract.getAddrMap5Value(addr))).toBeNull();
                expect((await contract.getAddrMap6_1Value(addr))).toBe(null);
                expect((await contract.getAddrMap6_2Value(addr))).toBe(null);
                expect((await contract.getAddrMap6_3Value(addr))).toBe(null);
                expect((await contract.getAddrMap6_4Value(addr))).toBe(null);
                expect((await contract.getAddrMap6_5Value(addr))).toBe(null);
                expect((await contract.getAddrMap6_6Value(addr))).toBe(null);
                expect((await contract.getAddrMap6_7Value(addr))).toBe(null);
                expect((await contract.getAddrMap7_1Value(addr))).toBe(null);
                expect((await contract.getAddrMap7_2Value(addr))).toBe(null);
                expect((await contract.getAddrMap7_3Value(addr))).toBe(null);
                expect((await contract.getAddrMap7_4Value(addr))).toBe(null);
                expect((await contract.getAddrMap7_5Value(addr))).toBe(null);
                expect((await contract.getAddrMap7_6Value(addr))).toBe(null);
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