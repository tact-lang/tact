import { Address, beginCell, Cell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { IntrinsicsTester } from "./contracts/output/intrinsics_IntrinsicsTester";
import { sha256_sync } from "@ton/crypto";
import "@ton/test-utils";

describe("intrinsics", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<IntrinsicsTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await IntrinsicsTester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should return correct intrinsic results", async () => {
        // Compile-time constants
        expect(await contract.getGetTons()).toBe(toNano("10.1234"));
        expect(await contract.getGetTons2()).toBe(toNano("10.1234"));
        expect(await contract.getGetString()).toBe("Hello world");
        expect(await contract.getGetString2()).toBe("Hello world");
        expect(
            (await contract.getGetAddress()).equals(
                Address.parse(
                    "EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N",
                ),
            ),
        ).toBe(true);
        expect(
            (await contract.getGetAddress2()).equals(
                Address.parse(
                    "EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N",
                ),
            ),
        ).toBe(true);
        expect(
            (await contract.getGetCell()).equals(
                Cell.fromBase64("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
            ),
        ).toBe(true);
        expect(
            (await contract.getGetCell2()).equals(
                Cell.fromBase64("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
            ),
        ).toBe(true);
        expect(await contract.getGetPow()).toBe(512n);
        expect(await contract.getGetPow2()).toBe(512n);

        // Compile-time optimizations
        expect(
            (await contract.getGetComment()).equals(
                beginCell()
                    .storeUint(0, 32)
                    .storeStringTail("Hello world")
                    .endCell(),
            ),
        ).toBe(true);

        // Compile-time send/emit optimizations
        const emitResult = await contract.send(
            treasure.getSender(),
            { value: toNano(1) },
            "emit_1",
        );

        // Verify emitted message
        expect(emitResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            outMessagesCount: 1,
        });
        const outMessage = emitResult.externals[0]!.body.beginParse();
        expect(outMessage.loadUint(32)).toEqual(0);
        expect(outMessage.loadStringTail()).toEqual("Hello world");
        expect(outMessage.remainingBits).toEqual(0);
        expect(outMessage.remainingRefs).toEqual(0);

        // Check sha256
        function sha256(src: string | Buffer) {
            return BigInt("0x" + sha256_sync(src).toString("hex"));
        }
        expect(await contract.getGetHash()).toBe(sha256("hello world"));
        expect(await contract.getGetHash2()).toBe(sha256("hello world"));
        expect(
            await contract.getGetHash3(
                beginCell().storeStringTail("sometest").endCell().asSlice(),
            ),
        ).toBe(sha256("sometest"));
        expect(await contract.getGetHash4("wallet")).toBe(sha256("wallet"));

        // Check `slice`
        expect(
            (await contract.getGetSlice())
                .asCell()
                .equals(
                    Cell.fromBase64("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
                ),
        ).toBe(true);
        expect(
            (await contract.getGetSlice2())
                .asCell()
                .equals(
                    Cell.fromBase64("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
                ),
        ).toBe(true);

        // Check `rawSlice`
        expect(
            (await contract.getGetRawSlice())
                .asCell()
                .equals(beginCell().storeStringTail("hello world").endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice2())
                .asCell()
                .equals(beginCell().storeStringTail("hello world").endCell()),
        ).toBe(true);

        // Check `ascii`
        expect(await contract.getGetAscii()).toBe(
            BigInt("0x68656c6c6f20776f726c64"),
        );
        expect(await contract.getGetAscii2()).toBe(
            BigInt("0x68656c6c6f20776f726c64"),
        );

        // Check `crc32`
        expect(await contract.getGetCrc32()).toBe(BigInt(2235694568));
        expect(await contract.getGetCrc32_2()).toBe(BigInt(2235694568));
    });
});
