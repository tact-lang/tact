import { beginCell, Builder, Cell, Slice, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { SerializationTester3 } from "./contracts/output/serialization-3_SerializationTester3";
import { SerializationTester2 } from "./contracts/output/serialization-2_SerializationTester2";
import { SerializationTester } from "./contracts/output/serialization_SerializationTester";
import "@ton/test-utils";

describe("serialization", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
    });

    //
    // Simple case
    //
    {
        const cases: {
            a: bigint;
            b: bigint;
            c: bigint;
            d: bigint;
            e: bigint;
            f: bigint;
            g: bigint;
            h: bigint;
            i: bigint;
        }[] = [];
        cases.push({
            a: 1n,
            b: 2n,
            c: 3n,
            d: 4n,
            e: 5n,
            f: 6n,
            g: 7n,
            h: 8n,
            i: 9n,
        });

        for (let i = 0; i < cases.length; i++) {
            it("should handle case #" + i, async () => {
                const cs = cases[i]!;

                // Init contract
                const contract = blockchain.openContract(
                    await SerializationTester.fromInit(
                        cs.a,
                        cs.b,
                        cs.c,
                        cs.d,
                        cs.e,
                        cs.f,
                        cs.g,
                        cs.h,
                        cs.i,
                    ),
                );

                const deployResult = await contract.send(
                    treasure.getSender(),
                    { value: toNano("10") },
                    null,
                );

                expect(deployResult.transactions).toHaveTransaction({
                    from: treasure.address,
                    to: contract.address,
                    success: true,
                    deploy: true,
                });

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
            });
        }
    }

    //
    // Cases with references
    //
    {
        const cases: {
            a: {
                $$type: "Vars";
                a: bigint;
                b: bigint;
                c: bigint;
                d: bigint;
                e: bigint;
            };
            b: {
                $$type: "Vars";
                a: bigint;
                b: bigint;
                c: bigint;
                d: bigint;
                e: bigint;
            };
        }[] = [];
        cases.push({
            a: {
                $$type: "Vars",
                a: 1n,
                b: 2n,
                c: 3n,
                d: 4n,
                e: 5n,
            },
            b: {
                $$type: "Vars",
                a: 6n,
                b: 7n,
                c: 8n,
                d: 9n,
                e: 10n,
            },
        });

        for (let i = 0; i < cases.length; i++) {
            it("should handle case-2 #" + i, async () => {
                const cs = cases[i]!;

                // Init contract
                const contract = blockchain.openContract(
                    await SerializationTester2.fromInit(cs.a, cs.b),
                );

                const deployResult = await contract.send(
                    treasure.getSender(),
                    { value: toNano("10") },
                    null,
                );

                expect(deployResult.transactions).toHaveTransaction({
                    from: treasure.address,
                    to: contract.address,
                    success: true,
                    deploy: true,
                });

                // Check values
                const a = await contract.getGetA();
                const aOpt = await contract.getGetAOpt();
                const b = await contract.getGetB();
                const bOpt = await contract.getGetBOpt();
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

    it("serialization-3", async () => {
        // Init contract
        const contract = blockchain.openContract(
            await SerializationTester3.fromInit(
                1n,
                true,
                beginCell().endCell(),
                beginCell().endCell().asSlice(),
                beginCell().endCell().asBuilder(),
                "test",
            ),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Check values
        expect(await contract.getGetA()).toBe(1n);
        expect(await contract.getGetB()).toBe(true);
        expect(await contract.getGetC()).toBeInstanceOf(Cell);
        expect(await contract.getGetD()).toBeInstanceOf(Slice);
        expect(await contract.getGetE()).toBeInstanceOf(Builder);
        expect(await contract.getGetF()).toBe("test");
    });
});
