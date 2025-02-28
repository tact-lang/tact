import { randomAddress } from "../utils/random-utils";
import type {
    SomeGenericStruct,
    StructWithOptionals,
} from "./contracts/output/optionals_ContractWithOptionals";
import { ContractWithOptionals } from "./contracts/output/optionals_ContractWithOptionals";
import { Opt4 } from "./contracts/output/optionals_Opt4";
import type { Address, Cell } from "@ton/core";
import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import "@ton/test-utils";

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

describe("features", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
    });

    const eV = {
        $$type: "SomeGenericStruct" as const,
        value1: 1n,
        value2: 2n,
        value3: 3n,
        value4: 4n,
        value5: 5n,
    };
    const ev2: StructWithOptionals = {
        $$type: "StructWithOptionals" as const,
        a: 1n,
        b: true,
        c: null,
        d: randomAddress(0, "address1"),
        e: eV,
    };
    const ev3: StructWithOptionals = {
        $$type: "StructWithOptionals" as const,
        a: 1n,
        b: true,
        c: null,
        d: null,
        e: null,
    };
    const cases: {
        a: bigint | null;
        b: boolean | null;
        c: Cell | null;
        d: Address | null;
        e: SomeGenericStruct | null;
        f: StructWithOptionals | null;
    }[] = [];
    cases.push({ a: null, b: null, c: null, d: null, e: null, f: null });
    cases.push({
        a: 10n,
        b: true,
        c: null,
        d: randomAddress(0, "address1"),
        e: eV,
        f: ev2,
    });
    cases.push({
        a: -10n,
        b: false,
        c: null,
        d: randomAddress(-1, "address2"),
        e: null,
        f: ev2,
    });
    cases.push({
        a: -10n,
        b: false,
        c: beginCell().storeAddress(randomAddress(0, "asdasd")).endCell(),
        d: randomAddress(-1, "address2"),
        e: null,
        f: ev3,
    });

    for (let i = 0; i < cases.length; i++) {
        it("should handle case #" + i, async () => {
            const cs = cases[i]!;

            const contract = blockchain.openContract(
                await ContractWithOptionals.fromInit(
                    cs.a,
                    cs.b,
                    cs.c,
                    cs.d,
                    cs.e,
                    cs.f,
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
            });

            if (cs.a !== null) {
                expect(await contract.getNotNullA()).toBe(cs.a);
            } else {
                await expect(() => contract.getNotNullA()).rejects.toThrowError(
                    "Unable to execute get method. Got exit_code: 128",
                );
            }
            if (cs.b !== null) {
                expect((await contract.getNotNullB()) === cs.b).toBe(true);
            } else {
                await expect(() => contract.getNotNullB()).rejects.toThrowError(
                    "Unable to execute get method. Got exit_code: 128",
                );
            }
            if (cs.c !== null) {
                expect((await contract.getNotNullC()).equals(cs.c)).toBe(true);
            } else {
                await expect(() => contract.getNotNullC()).rejects.toThrowError(
                    "Unable to execute get method. Got exit_code: 128",
                );
            }
            if (cs.d !== null) {
                expect((await contract.getNotNullD()).equals(cs.d)).toBe(true);
            } else {
                await expect(() => contract.getNotNullD()).rejects.toThrowError(
                    "Unable to execute get method. Got exit_code: 128",
                );
            }
            if (cs.e !== null) {
                expect(strEq(await contract.getNotNullE(), cs.e)).toBe(true);
            } else {
                await expect(() => contract.getNotNullE()).rejects.toThrowError(
                    "Unable to execute get method. Got exit_code: 128",
                );
            }
            if (cs.f !== null) {
                expect(strEq2(await contract.getNotNullF(), cs.f)).toBe(true);
            } else {
                await expect(() => contract.getNotNullF()).rejects.toThrowError(
                    "Unable to execute get method. Got exit_code: 128",
                );
            }

            // Check inputs
            expect(await contract.getIsNotNullA()).toBe(cs.a !== null);
            expect(await contract.getIsNotNullB()).toBe(cs.b !== null);
            expect(await contract.getIsNotNullC()).toBe(cs.c !== null);
            expect(await contract.getIsNotNullD()).toBe(cs.d !== null);
            expect(await contract.getIsNotNullE()).toBe(cs.e !== null);
            expect(await contract.getIsNotNullF()).toBe(cs.f !== null);
        });
    }

    it("Optional address should load correctly", async () => {
        const contract = blockchain.openContract(await Opt4.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano(1) },
            {
                $$type: "OptAddr",
                x: BigInt(255),
                y: null,
                z: BigInt(12345),
            },
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        expect(await contract.getZ()).toEqual(12345n);
    });
});
