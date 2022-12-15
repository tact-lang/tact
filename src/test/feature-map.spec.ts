import BN from 'bn.js';
import { beginCell } from 'ton';
import { createExecutorFromCode } from 'ton-nodejs';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { MapTestContract, MapTestContract_init, SomeStruct } from './features/output/maps_MapTestContract';

function strEq(a: SomeStruct | null, b: SomeStruct | null) {
    if (a === null || b === null) {
        return a === b;
    }
    return a.value.eq(b.value);
}

describe('feature-map', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement maps correctly', async () => {

        // Init
        let init = await MapTestContract_init();
        let executor = await createExecutorFromCode(init);
        let contract = new MapTestContract(executor);

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
        let keys: BN[] = [];
        keys.push(new BN(1));
        keys.push(new BN(0));
        keys.push(new BN(-1));
        keys.push(new BN('10102312312312312312312'));
        keys.push(new BN('-10102312312312312312312'));
        for (let k of keys) {

            // Check keys to be empty
            expect(await contract.getIntMap1Value(k)).toBeNull();
            expect(await contract.getIntMap2Value(k)).toBeNull();
            expect(await contract.getIntMap3Value(k)).toBeNull();
            expect(await contract.getIntMap4Value(k)).toBeNull();

            // Set keys
            let valueInt = k.muln(10);
            let valueBool = k.isNeg();
            let valueCell = beginCell().storeUint(123123, 128).endCell();
            let valueStruct: SomeStruct = { $$type: 'SomeStruct', value: new BN(10012312) };
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap1', key: k, value: valueInt });
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap2', key: k, value: valueBool });
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap3', key: k, value: valueCell });
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap4', key: k, value: valueStruct });

            // Check value set
            expect((await contract.getIntMap1Value(k))!.eq(valueInt)).toBe(true);
            expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
            expect((await contract.getIntMap3Value(k))!.equals(valueCell)).toBe(true);
            expect(strEq((await contract.getIntMap4Value(k))!, valueStruct)).toBe(true);

            // Clear keys
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap1', key: k, value: null });
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap2', key: k, value: null });
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap3', key: k, value: null });
            await contract.send({ amount: new BN(0), debug: true }, { $$type: 'SetIntMap4', key: k, value: null });

            // Check value cleared
            expect((await contract.getIntMap1Value(k))).toBeNull();
            expect((await contract.getIntMap2Value(k))).toBeNull();
            expect((await contract.getIntMap3Value(k))).toBeNull();
            expect((await contract.getIntMap4Value(k))).toBeNull();
        }
    });
});