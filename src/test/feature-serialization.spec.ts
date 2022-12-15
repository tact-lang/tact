import BN from 'bn.js';
import { createExecutorFromCode } from 'ton-nodejs';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SerializationTester, SerializationTester_init } from './features/output/serialization_SerializationTester';

describe('feature-serialization', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });


    //
    // Simple case
    //
    {
        let cases: { a: BN, b: BN, c: BN, d: BN, e: BN, f: BN, g: BN, h: BN, i: BN }[] = [];
        cases.push({
            a: new BN(1),
            b: new BN(2),
            c: new BN(3),
            d: new BN(4),
            e: new BN(5),
            f: new BN(6),
            g: new BN(7),
            h: new BN(8),
            i: new BN(9)
        });

        for (let i = 0; i < cases.length; i++) {

            it('should handle case #' + i, async () => {
                let cs = cases[i];

                // Init contract
                let init = await SerializationTester_init(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f, cs.g, cs.h, cs.i);
                let executor = await createExecutorFromCode(init);
                let contract = new SerializationTester(executor);

                // Check inputs
                expect((await contract.getGetA()).eq(cs.a)).toBe(true);
                expect((await contract.getGetB()).eq(cs.b)).toBe(true);
                expect((await contract.getGetC()).eq(cs.c)).toBe(true);
                expect((await contract.getGetD()).eq(cs.d)).toBe(true);
                expect((await contract.getGetE()).eq(cs.e)).toBe(true);
                expect((await contract.getGetF()).eq(cs.f)).toBe(true);
                expect((await contract.getGetG()).eq(cs.g)).toBe(true);
                expect((await contract.getGetH()).eq(cs.h)).toBe(true);
                expect((await contract.getGetI()).eq(cs.i)).toBe(true);
            })
        }
    }

    //
    // Cases with references
    //
    // {
    //     let cases: { a: { a: BN, b: BN, c: BN, d: BN, e: BN }, b: { a: BN, b: BN, c: BN, d: BN, e: BN } }[] = [];

    //     for (let i = 0; i < cases.length; i++) {
    //         it('should handle case-2 #' + i, async () => {
    //             let cs = cases[i];

    //             // Init contract
    //             let init = await SerializationTester_init(cs.a, cs.b, cs.c, cs.d, cs.e, cs.f, cs.g, cs.h, cs.i);
    //             let executor = await createExecutorFromCode(init);
    //             let contract = new SerializationTester(executor);
    //         });
    //     }
    // }
});