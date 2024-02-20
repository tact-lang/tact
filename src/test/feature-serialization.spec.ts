import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SerializationTester2 } from './features/output/serialization-2_SerializationTester2';
import { SerializationTester } from './features/output/serialization_SerializationTester';

describe('feature-serialization', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });


    //
    // Simple case
    //
    {
        const cases: { a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint }[] = [];
        cases.push({
            a: 1n,
            b: 2n,
            c: 3n,
            d: 4n,
            e: 5n,
            f: 6n,
            g: 7n,
            h: 8n,
            i: 9n
        });

        for (let i = 0; i < cases.length; i++) {

            it('should handle case #' + i, async () => {
                const cs = cases[i];

                // Init contract
                const system = await ContractSystem.create();
                const treasure = system.treasure('treasure');
                const contract = system.open(await SerializationTester.fromInit(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f, cs.g, cs.h, cs.i));
                await contract.send(treasure, { value: toNano('10') }, null);
                await system.run();

                // Check inputs
                expect(await contract.getGetA()).toBe(cs.a);
                expect(await contract.getGetB()).toBe(cs.b);
                expect(await contract.getGetC()).toBe(cs.c);
                expect(await contract.getGetD()).toBe(cs.d);
                expect(await contract.getGetE()).toBe(cs.e);
                expect(await contract.getGetF()).toBe(cs.f);
                expect(await contract.getGetG()).toBe(cs.g);
                expect(await contract.getGetH()).toBe(cs.h);
                expect(await contract.getGetI()).toBe(cs.i);
            })
        }
    }

    //
    // Cases with references
    //
    {
        const cases: { a: { $$type: 'Vars', a: bigint, b: bigint, c: bigint, d: bigint, e: bigint }, b: { $$type: 'Vars', a: bigint, b: bigint, c: bigint, d: bigint, e: bigint } }[] = [];
        cases.push({
            a: {
                $$type: 'Vars',
                a: 1n,
                b: 2n,
                c: 3n,
                d: 4n,
                e: 5n
            },
            b: {
                $$type: 'Vars',
                a: 6n,
                b: 7n,
                c: 8n,
                d: 9n,
                e: 10n
            }
        })

        for (let i = 0; i < cases.length; i++) {
            it('should handle case-2 #' + i, async () => {
                const cs = cases[i];

                // Init contract
                const system = await ContractSystem.create();
                const treasure = system.treasure('treasure');
                const contract = system.open(await SerializationTester2.fromInit(cs.a, cs.b));
                await contract.send(treasure, { value: toNano('10') }, null);
                await system.run();

                // Checl values
                const a = await contract.getGetA();
                const aOpt = await contract.getGetAopt();
                const b = await contract.getGetB();
                const bOpt = await contract.getGetBopt();
                const both = await contract.getGetBoth();
                expect(aOpt).toMatchObject(a);
                expect(bOpt).toMatchObject(b);
                expect(a.a).toBe(cs.a.a);
                expect(a.b).toBe(cs.a.b);
                expect(a.c).toBe(cs.a.c);
                expect(a.d).toBe(cs.a.d);
                expect(a.e).toBe(cs.a.e);
                expect(b.a).toBe(cs.b.a);
                expect(b.b).toBe(cs.b.b);
                expect(b.c).toBe(cs.b.c);
                expect(b.d).toBe(cs.b.d);
                expect(b.e).toBe(cs.b.e);
                expect(both.a.a).toBe(cs.a.a);
                expect(both.a.b).toBe(cs.a.b);
                expect(both.a.c).toBe(cs.a.c);
                expect(both.a.d).toBe(cs.a.d);
                expect(both.a.e).toBe(cs.a.e);
                expect(both.b.a).toBe(cs.b.a);
                expect(both.b.b).toBe(cs.b.b);
                expect(both.b.c).toBe(cs.b.c);
                expect(both.b.d).toBe(cs.b.d);
                expect(both.b.e).toBe(cs.b.e);
            });
        }
    }
});