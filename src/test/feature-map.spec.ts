import { randomAddress } from './utils/randomAddress';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { MapTestContract, SomeStruct } from './features/output/maps_MapTestContract';
import { ContractSystem } from 'ton-emulator';
import { beginCell, toNano } from 'ton-core';
import { inspect } from 'util';
import { ComputeError } from 'ton-core';

function strEq(a: SomeStruct | null, b: SomeStruct | null) {
    if (a === null || b === null) {
        return a === b;
    }
    return a.value === b.value;
}

describe('feature-map', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement maps correctly', async () => {

        try {

            // Init contract
            let system = await ContractSystem.create();
            let treasure = system.treasure('treasure');
            let contract = system.open(await MapTestContract.fromInit());
            await contract.send(treasure, { value: toNano('10') }, null);
            await system.run();

            // Initial state
            expect(await contract.getIntMap1()).toBeNull();
            expect(await contract.getIntMap2()).toBeNull();
            expect(await contract.getIntMap3()).toBeNull();
            expect(await contract.getIntMap4()).toBeNull();
            expect(await contract.getAddrMap1()).toBeNull();
            expect(await contract.getAddrMap2()).toBeNull();
            expect(await contract.getAddrMap3()).toBeNull();
            expect(await contract.getAddrMap4()).toBeNull();

            // Keys for test
            let keys: bigint[] = [];
            keys.push(1n);
            keys.push(0n);
            keys.push(-1n);
            keys.push(10102312312312312312312n);
            keys.push(-10102312312312312312312n);
            for (let k of keys) {

                // Check keys to be empty
                expect(await contract.getIntMap1Value(k)).toBeNull();
                expect(await contract.getIntMap2Value(k)).toBeNull();
                expect(await contract.getIntMap3Value(k)).toBeNull();
                expect(await contract.getIntMap4Value(k)).toBeNull();

                // Set keys
                let valueInt = k * 10n;
                let valueBool = k < 0n;
                let addr = randomAddress(0, 'addr-' + k.toString(10));
                let valueCell = beginCell().storeUint(123123, 128).endCell();
                let valueStruct: SomeStruct = { $$type: 'SomeStruct', value: 10012312n };
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap1', key: k, value: valueInt });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap2', key: k, value: valueBool });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap3', key: k, value: valueCell });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap4', key: k, value: valueStruct });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap1', key: addr, value: valueInt });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap2', key: addr, value: valueBool });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap3', key: addr, value: valueCell });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap4', key: addr, value: valueStruct });
                await system.run();

                // Check value set
                expect((await contract.getIntMap1Value(k))).toBe(valueInt);
                expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
                expect((await contract.getIntMap3Value(k))!.equals(valueCell)).toBe(true);
                expect(strEq((await contract.getIntMap4Value(k))!, valueStruct)).toBe(true);

                expect((await contract.getAddrMap1Value(addr))).toBe(valueInt);
                expect((await contract.getAddrMap2Value(addr))!).toBe(valueBool);
                expect((await contract.getAddrMap3Value(addr))!.equals(valueCell)).toBe(true);
                expect(strEq((await contract.getAddrMap4Value(addr))!, valueStruct)).toBe(true);

                // Clear keys
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap1', key: k, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap2', key: k, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap3', key: k, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetIntMap4', key: k, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap1', key: addr, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap2', key: addr, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap3', key: addr, value: null });
                await system.run();
                await contract.send(treasure, { value: toNano(1) }, { $$type: 'SetAddrMap4', key: addr, value: null });
                await system.run();


                // Check value cleared
                expect((await contract.getIntMap1Value(k))).toBeNull();
                expect((await contract.getIntMap2Value(k))).toBeNull();
                expect((await contract.getIntMap3Value(k))).toBeNull();
                expect((await contract.getIntMap4Value(k))).toBeNull();
                expect((await contract.getAddrMap1Value(addr))).toBeNull();
                expect((await contract.getAddrMap2Value(addr))).toBeNull();
                expect((await contract.getAddrMap3Value(addr))).toBeNull();
                expect((await contract.getAddrMap4Value(addr))).toBeNull();
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