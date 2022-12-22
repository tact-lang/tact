import BN from 'bn.js';
import { Address, beginCell, Cell } from 'ton';
import { createExecutorFromCode } from 'ton-nodejs';
import { randomAddress } from './utils/randomAddress';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { ContractWithOptionals, ContractWithOptionals_init, SomeGenericStruct, StructWithOptionals } from './features/output/optionals_ContractWithOptionals';

function strEq2(a: StructWithOptionals | null, b: StructWithOptionals | null) {

    // Null checks
    if (a === null && b === null) {
        return true;
    }
    if (a !== null && b === null) {
        return false;
    }
    if (a === null && b !== null) {
        return false;
    }

    // a: BN | null;
    if (a!.a === null && b!.a !== null) {
        return false;
    }
    if (a!.a !== null && b!.a === null) {
        return false;
    }
    if (a!.a !== null && b!.a !== null && !a!.a.eq(b!.a)) {
        return false;
    }

    // b: boolean | null;
    if (a!.b === null && b!.b !== null) {
        return false;
    }
    if (a!.b !== null && b!.b === null) {
        return false;
    }
    if (a!.b !== null && b!.b !== null && a!.b !== b!.b) {
        return false;
    }

    // c: Cell | null;
    if (a!.c === null && b!.c !== null) {
        return false;
    }
    if (a!.c !== null && b!.c === null) {
        return false;
    }
    if (a!.c !== null && b!.c !== null && !a!.c.equals(b!.c)) {
        return false;
    }

    // d: Address | null;
    if (a!.d === null && b!.d !== null) {
        return false;
    }
    if (a!.d !== null && b!.d === null) {
        return false;
    }
    if (a!.d !== null && b!.d !== null && !a!.d.equals(b!.d)) {
        return false;
    }

    // e: SomeGenericStruct | null;
    if (a!.e === null && b!.e !== null) {
        return false;
    }
    if (a!.e !== null && b!.e === null) {
        return false;
    }
    if (a!.e !== null && b!.e !== null && !strEq(a!.e, b!.e)) {
        return false;
    }

    return true;
}

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
    if (!a!.value1.eq(b!.value1)) {
        return false;
    }
    if (!a!.value2.eq(b!.value2)) {
        return false;
    }
    if (!a!.value3.eq(b!.value3)) {
        return false;
    }
    if (!a!.value4.eq(b!.value4)) {
        return false;
    }
    if (!a!.value5.eq(b!.value5)) {
        return false;
    }
    return true;
}

describe('features', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    let eV = {
        $$type: 'SomeGenericStruct' as const,
        value1: new BN(1),
        value2: new BN(2),
        value3: new BN(3),
        value4: new BN(4),
        value5: new BN(5)
    };
    let ev2: StructWithOptionals = {
        $$type: 'StructWithOptionals' as const,
        a: new BN(1),
        b: true,
        c: null,
        d: randomAddress(0, 'address1'),
        e: eV,
    };
    let ev3: StructWithOptionals = {
        $$type: 'StructWithOptionals' as const,
        a: new BN(1),
        b: true,
        c: null,
        d: null,
        e: null,
    };
    let cases: { a: BN | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null }[] = [];
    cases.push({ a: null, b: null, c: null, d: null, e: null, f: null });
    cases.push({ a: new BN(10), b: true, c: null, d: randomAddress(0, 'address1'), e: eV, f: ev2 });
    cases.push({ a: new BN(-10), b: false, c: null, d: randomAddress(-1, 'address2'), e: null, f: ev2 });
    cases.push({ a: new BN(-10), b: false, c: beginCell().storeAddress(randomAddress(0, 'asdasd')).endCell(), d: randomAddress(-1, 'address2'), e: null, f: ev3 });

    for (let i = 0; i < cases.length; i++) {

        it('should handle case #' + i, async () => {
            let cs = cases[i];

            // Init contract
            let init = await ContractWithOptionals_init(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f);
            let executor = await createExecutorFromCode(init);
            let contract = new ContractWithOptionals(executor);

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
            if (cs.f !== null) {
                expect(strEq2((await contract.getNotNullF()), cs.f)).toBe(true);
            } else {
                await expect(() => contract.getNotNullF()).rejects.toThrowError('Null reference exception');
            }

            // Check inputs
            expect(await contract.getIsNotNullA()).toBe(cs.a !== null);
            expect(await contract.getIsNotNullB()).toBe(cs.b !== null);
            expect(await contract.getIsNotNullC()).toBe(cs.c !== null);
            expect(await contract.getIsNotNullD()).toBe(cs.d !== null);
            expect(await contract.getIsNotNullE()).toBe(cs.e !== null);
            expect(await contract.getIsNotNullF()).toBe(cs.f !== null);
        })
    }
});