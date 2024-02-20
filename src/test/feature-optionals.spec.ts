import { randomAddress } from './utils/randomAddress';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { ContractWithOptionals, SomeGenericStruct, StructWithOptionals } from './features/output/optionals_ContractWithOptionals';
import { Address, beginCell, Cell, toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';

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
    if (a!.a !== null && b!.a !== null && a!.a !== b!.a) {
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
    if (a!.value1 !== b!.value1) {
        return false;
    }
    if (a!.value2 !== b!.value2) {
        return false;
    }
    if (a!.value3 !== b!.value3) {
        return false;
    }
    if (a!.value4 !== b!.value4) {
        return false;
    }
    if (a!.value5 !== b!.value5) {
        return false;
    }
    return true;
}

describe('features', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    const eV = {
        $$type: 'SomeGenericStruct' as const,
        value1: 1n,
        value2: 2n,
        value3: 3n,
        value4: 4n,
        value5: 5n
    };
    const ev2: StructWithOptionals = {
        $$type: 'StructWithOptionals' as const,
        a: 1n,
        b: true,
        c: null,
        d: randomAddress(0, 'address1'),
        e: eV,
    };
    const ev3: StructWithOptionals = {
        $$type: 'StructWithOptionals' as const,
        a: 1n,
        b: true,
        c: null,
        d: null,
        e: null,
    };
    const cases: { a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null }[] = [];
    cases.push({ a: null, b: null, c: null, d: null, e: null, f: null });
    cases.push({ a: 10n, b: true, c: null, d: randomAddress(0, 'address1'), e: eV, f: ev2 });
    cases.push({ a: -10n, b: false, c: null, d: randomAddress(-1, 'address2'), e: null, f: ev2 });
    cases.push({ a: -10n, b: false, c: beginCell().storeAddress(randomAddress(0, 'asdasd')).endCell(), d: randomAddress(-1, 'address2'), e: null, f: ev3 });

    for (let i = 0; i < cases.length; i++) {

        it('should handle case #' + i, async () => {
            const cs = cases[i];

            // Init contract
            const system = await ContractSystem.create();
            const treasure = system.treasure('treasure');
            const contract = system.open(await ContractWithOptionals.fromInit(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f));
            await contract.send(treasure, { value: toNano('10') }, null);
            await system.run();

            // Check inputs
            if (cs.a !== null) {
                expect(await contract.getNotNullA()).toBe(cs.a);
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