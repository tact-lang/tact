import BN from 'bn.js';
import { Address, beginCell, Cell } from 'ton';
import { createExecutorFromCode } from 'ton-nodejs';
import { randomAddress } from '../examples/utils/randomAddress';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { MapTestContract, MapTestContract_init, SomeStruct } from './features/output/maps_MapTestContract';
import { ContractWithOptionals, ContractWithOptionals_init, SomeGenericStruct, StructWithOptionals } from './features/output/optionals_ContractWithOptionals';

function strEq(a: SomeGenericStruct | null, b: SomeGenericStruct | null) {
    if (a === null && b === null) {
        return true;
    }
    if (a !== null && b === null) {
        return false;
    }
    if (a === null && b !== null) {
        return false;
    }
    if (a!.value1.eq(b!.value1)) {
        return false;
    }
    if (a!.value2.eq(b!.value2)) {
        return false;
    }
    if (a!.value3.eq(b!.value3)) {
        return false;
    }
    if (a!.value4.eq(b!.value4)) {
        return false;
    }
    if (a!.value5.eq(b!.value5)) {
        return false;
    }
    return true;
}

describe('features', () => {
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

            // Check value set
            // console.warn(valueBool);
            // let parsed = parseDict((await contract.getIntMap2())!.beginParse(), 257, (s) => s.readBit());
            // console.warn(parsed);
            expect((await contract.getIntMap1Value(k))!.eq(valueInt)).toBe(true);
            expect((await contract.getIntMap2Value(k))!).toBe(valueBool);
            expect((await contract.getIntMap3Value(k))!.equals(valueCell)).toBe(true);
            // expect(await contract.getIntMap4Value(k)).toBeNull();
        }
    });

    it('should handle optionals', async () => {

        let cases: { a: BN | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null }[] = [];
        cases.push({ a: null, b: null, c: null, d: null, e: null, f: null });
        cases.push({
            a: new BN(10), b: true, c: null, d: randomAddress(0, 'address1'), e: {
                $$type: 'SomeGenericStruct', 
                value1: new BN(1),
                value2: new BN(1),
                value3: new BN(1),
                value4: new BN(1),
                value5: new BN(1)
            }, f: null
        });
        cases.push({ a: new BN(-10), b: false, c: null, d: randomAddress(-1, 'address2'), e: null, f: null });

        for (let cs of cases) {

            // Init contract
            let init = await ContractWithOptionals_init(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f);
            let executor = await createExecutorFromCode(init);
            let contract = new ContractWithOptionals(executor);

            // Check inputs
            expect(await contract.getIsNotNullA()).toBe(cs.a !== null);
            expect(await contract.getIsNotNullB()).toBe(cs.b !== null);
            expect(await contract.getIsNotNullC()).toBe(cs.c !== null);
            expect(await contract.getIsNotNullD()).toBe(cs.d !== null);
            expect(await contract.getIsNotNullE()).toBe(cs.e !== null);
            expect(await contract.getIsNotNullF()).toBe(cs.f !== null);

            // Check inputs
            if (cs.a !== null) {
                expect((await contract.getNotNullA()).eq(cs.a)).toBe(true);
            } else {
                await expect(() => contract.getNotNullA()).rejects.toThrowError('Exit code: 14');
            }
            if (cs.b !== null) {
                expect((await contract.getNotNullB()) === cs.b).toBe(true);
            } else {
                await expect(() => contract.getNotNullB()).rejects.toThrowError('Exit code: 14');
            }
            if (cs.c !== null) {
                expect((await contract.getNotNullC()).equals(cs.c)).toBe(true);
            } else {
                await expect(() => contract.getNotNullC()).rejects.toThrowError('Exit code: 14');
            }
            if (cs.d !== null) {
                expect((await contract.getNotNullD()).equals(cs.d)).toBe(true);
            } else {
                await expect(() => contract.getNotNullD()).rejects.toThrowError('Exit code: 14');
            }
            if (cs.e !== null) {
                expect(strEq((await contract.getNotNullE()), cs.e)).toBe(true);
            } else {
                await expect(() => contract.getNotNullD()).rejects.toThrowError('Exit code: 14');
            }
            // expect(await contract.getNotNullB()).toBe(cs.a !== null);
            // expect(await contract.getNotNullC()).toBe(cs.a !== null);
            // expect(await contract.getNotNullD()).toBe(cs.a !== null);
            // expect(await contract.getNotNullE()).toBe(cs.a !== null);
        }
    })
});