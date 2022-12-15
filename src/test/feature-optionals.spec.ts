import BN from 'bn.js';
import { Address, Cell } from 'ton';
import { createExecutorFromCode } from 'ton-nodejs';
import { randomAddress } from '../examples/utils/randomAddress';
import { __DANGER_resetNodeId } from '../grammar/ast';
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
    it('should handle optionals', async () => {

        let eV = {
            $$type: 'SomeGenericStruct' as const,
            value1: new BN(1),
            value2: new BN(1),
            value3: new BN(1),
            value4: new BN(1),
            value5: new BN(1)
        };
        let cases: { a: BN | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null }[] = [];
        cases.push({ a: null, b: null, c: null, d: null, e: null, f: null });
        cases.push({ a: new BN(10), b: true, c: null, d: randomAddress(0, 'address1'), e: eV, f: null });
        cases.push({ a: new BN(-10), b: false, c: null, d: randomAddress(-1, 'address2'), e: null, f: null });

        for (let cs of cases) {

            // Init contract
            let init = await ContractWithOptionals_init(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f);
            console.warn(init.data.toDebugString());
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
                await expect(() => contract.getNotNullA()).rejects.toThrowError('Null reference exception');
            }
            if (cs.b !== null) {
                expect((await contract.getNotNullB()) === cs.b).toBe(true);
            } else {
                await expect(() => contract.getNotNullB()).rejects.toThrowError('Null reference exception');
            }
            if (cs.c !== null) {
                expect((await contract.getNotNullC()).equals(cs.c)).toBe(true);
            } else {
                await expect(() => contract.getNotNullC()).rejects.toThrowError('Null reference exception');
            }
            if (cs.d !== null) {
                expect((await contract.getNotNullD()).equals(cs.d)).toBe(true);
            } else {
                await expect(() => contract.getNotNullD()).rejects.toThrowError('Null reference exception');
            }
            if (cs.e !== null) {
                expect(strEq((await contract.getNotNullE()), cs.e)).toBe(true);
            } else {
                await expect(() => contract.getNotNullE()).rejects.toThrowError('Null reference exception');
            }
            // expect(await contract.getNotNullB()).toBe(cs.a !== null);
            // expect(await contract.getNotNullC()).toBe(cs.a !== null);
            // expect(await contract.getNotNullD()).toBe(cs.a !== null);
            // expect(await contract.getNotNullE()).toBe(cs.a !== null);
        }
    })
});