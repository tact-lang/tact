// eslint-disable rule-name
import { OpenedContract, beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { DNSTester } from "./contracts/output/dns_DNSTester";

function convertToInternal(src: string) {
    if (src === ".") {
        return Buffer.alloc(1, 0);
    }
    const parts = src.split(".").map((x) => Buffer.from(x));
    let res = Buffer.alloc(0);
    for (let i = 0; i < parts.length; i++) {
        if (i > 0) {
            res = Buffer.concat([res, Buffer.from([0])]);
        }
        res = Buffer.concat([res, parts[parts.length - i - 1]!]);
    }
    res = Buffer.concat([res, Buffer.from([0])]);
    return res;
    // let res = Buffer.alloc(0);
    // for (let s of src) {
    //     if (s === '.') {
    //         res = Buffer.concat([res, Buffer.from([0])]);
    //     } else {
    //         res = Buffer.concat([res, Buffer.from(s, 'latin1')]);
    //     }
    // }
    // if (!src.endsWith('.')) {
    //     res = Buffer.concat([res, Buffer.from([0])]);
    // }
    // return res;
}

describe("dns", () => {
    let contract: OpenedContract<DNSTester>;

    beforeEach(async () => {
        __DANGER_resetNodeId();
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        contract = system.open(await DNSTester.fromInit());
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();
    });

    const invalidNames = [
        "..",
        "a..b",
        "a.b..c",
        "a.b.c..",
        "a.!b",
        "a.-b",
        "a.b-",
        "_a.b",
        "a..b",
        "a b",
        "A.b",
    ];
    const validNames = [
        ".",
        "ton.dns",
        "a.b",
        "a.b.c",
        "a.b.c.d",
        "a.b.c.",
        "ton-dns.com",
        "ton-dns.com.hello",
    ];

    const equalNormalized = [
        ["ton.dns", "t0n.dns"],
        ["t1n.dns", "tln.dns"],
    ];
    const notEqualNormalized = [
        ["ton.dns", "tan.dns"],
        ["t1n.dns", "tin.dns"],
    ];

    for (const invalidName of invalidNames) {
        it(`should fail on invalid name: ${invalidName}`, async () => {
            expect(await contract.getStringToInternal(invalidName)).toBe(null);
            const internalAddress = convertToInternal(invalidName);
            expect(
                await contract.getDnsInternalVerify(
                    beginCell()
                        .storeBuffer(internalAddress)
                        .endCell()
                        .asSlice(),
                ),
            ).toBe(false);
        });
    }

    for (const validName of validNames) {
        it(`should convert valid name: ${validName}`, async () => {
            const data = (await contract.getStringToInternal(validName))!;
            const received = data
                .loadBuffer(data.remainingBits / 8)
                .toString("hex");
            expect(received).toBe(
                convertToInternal(
                    validName.endsWith(".") && validName !== "."
                        ? validName.slice(0, validName.length - 1)
                        : validName,
                ).toString("hex"),
            );
        });
    }

    for (const validName of validNames) {
        if (validName !== ".") {
            it(`should convert valid name: ${validName}`, async () => {
                const data = (await contract.getStringToInternal(validName))!;
                expect(await contract.getDnsInternalVerify(data)).toBe(true);
            });
        }
    }

    for (const equalNormalizedElem of equalNormalized) {
        it(`should convert equal normalized names: ${equalNormalizedElem[0]!} ${equalNormalizedElem[1]!}`, async () => {
            let data1 = (await contract.getStringToInternal(
                equalNormalizedElem[0]!,
            ))!;
            data1 = await contract.getInternalNormalize(data1);
            const received1 = data1
                .loadBuffer(data1.remainingBits / 8)
                .toString("hex");
            let data2 = (await contract.getStringToInternal(
                equalNormalizedElem[1]!,
            ))!;
            data2 = await contract.getInternalNormalize(data2);
            const received2 = data2
                .loadBuffer(data2.remainingBits / 8)
                .toString("hex");
            expect(received1).toBe(received2);
            expect(received1.length).toBe(received2.length);
        });
    }
    for (const notEqualNormalizedElem of notEqualNormalized) {
        it(`should convert not equal normalized names: ${notEqualNormalizedElem[0]!} ${notEqualNormalizedElem[1]!}`, async () => {
            let data1 = (await contract.getStringToInternal(
                notEqualNormalizedElem[0]!,
            ))!;
            data1 = await contract.getInternalNormalize(data1);
            const received1 = data1
                .loadBuffer(data1.remainingBits / 8)
                .toString("hex");
            let data2 = (await contract.getStringToInternal(
                notEqualNormalizedElem[1]!,
            ))!;
            data2 = await contract.getInternalNormalize(data2);
            const received2 = data2
                .loadBuffer(data2.remainingBits / 8)
                .toString("hex");
            expect(received1).not.toBe(received2);
            expect(received1.length).toBe(received2.length);
        });
    }

    for (const validName of validNames) {
        it("should resolve name " + validName, async () => {
            const internalAddress = convertToInternal(validName);
            const resolved = (await contract.getDnsresolve(
                beginCell().storeBuffer(internalAddress).endCell().asSlice(),
                1n,
            ))!;
            expect(resolved.prefix).toBe(BigInt(internalAddress.length * 8));
            if (validName === ".") {
                expect(resolved.record!.bits.length).toBe(0);
                expect(resolved.record!.refs.length).toBe(0);
            } else if (validName.endsWith(".")) {
                expect(
                    resolved
                        .record!.beginParse()
                        .loadBuffer(internalAddress.length - 1)
                        .toString("hex"),
                ).toBe(internalAddress.subarray(1).toString("hex"));
            } else {
                expect(
                    resolved
                        .record!.beginParse()
                        .loadBuffer(internalAddress.length)
                        .toString("hex"),
                ).toBe(internalAddress.toString("hex"));
            }
        });
    }

    for (const invalidName of invalidNames) {
        it("should not resolve name " + invalidName, async () => {
            const internalAddress = convertToInternal(invalidName);
            await expect(
                contract.getDnsresolve(
                    beginCell()
                        .storeBuffer(internalAddress)
                        .endCell()
                        .asSlice(),
                    1n,
                ),
            ).rejects.toThrowError();
        });
    }

    for (const validName of validNames) {
        if (validName.endsWith(".")) {
            continue;
        }
        it("should resolve name with leading zero " + validName, async () => {
            const internalAddress = convertToInternal(validName);
            const resolved = (await contract.getDnsresolve(
                beginCell()
                    .storeBuffer(
                        Buffer.concat([Buffer.alloc(1, 0), internalAddress]),
                    )
                    .endCell()
                    .asSlice(),
                1n,
            ))!;
            expect(resolved.prefix).toBe(
                BigInt(internalAddress.length * 8 + 8),
            );
            if (validName === ".") {
                expect(resolved.record!.bits.length).toBe(0);
                expect(resolved.record!.refs.length).toBe(0);
            } else {
                expect(
                    resolved
                        .record!.beginParse()
                        .loadBuffer(internalAddress.length)
                        .toString("hex"),
                ).toBe(internalAddress.toString("hex"));
            }
        });
    }
});
