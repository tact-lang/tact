import { Address, beginCell, Cell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { IntrinsicsTester } from "./contracts/output/intrinsics_IntrinsicsTester";
import { sha256_sync } from "@ton/crypto";
import "@ton/test-utils";
import { paddedBufferToBits } from "@ton/core/dist/boc/utils/paddedBits";

describe("intrinsics", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<IntrinsicsTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
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
        const longString =
            "------------------------------------------------------------------------------------------------------------------------------129";
        expect(await contract.getGetHashLongComptime()).toBe(
            sha256(longString),
        );
        // NOTE: The discrepancy here is expected, since SHA256U operates only on the first 127 bytes
        expect(
            (await contract.getGetHashLongRuntime(longString)) !==
                sha256(longString),
        ).toBe(true);

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
                .equals(
                    beginCell()
                        .storeBuffer(Buffer.from("abcdef", "hex"))
                        .endCell(),
                ),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice2())
                .asCell()
                .equals(
                    beginCell()
                        .storeBuffer(Buffer.from("abcdef", "hex"))
                        .endCell(),
                ),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice3()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice4()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice5())
                .asCell()
                .equals(beginCell().storeUint(18, 6).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice6())
                .asCell()
                .equals(beginCell().storeUint(18, 6).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice7()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice8()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice9())
                .asCell()
                .equals(beginCell().storeUint(0, 3).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice10())
                .asCell()
                .equals(beginCell().storeUint(0, 3).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice11()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice12()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice13())
                .asCell()
                .equals(beginCell().storeUint(7, 4).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice14())
                .asCell()
                .equals(beginCell().storeUint(7, 4).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice15()).asCell().equals(
                beginCell()
                    .storeBits(
                        paddedBufferToBits(
                            Buffer.from(
                                "abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcf",
                                "hex",
                            ),
                        ),
                    )
                    .endCell(),
            ),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice16()).asCell().equals(
                beginCell()
                    .storeBits(
                        paddedBufferToBits(
                            Buffer.from(
                                "abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcf",
                                "hex",
                            ),
                        ),
                    )
                    .endCell(),
            ),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice17())
                .asCell()
                .equals(beginCell().storeUint(0b100010, 6).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice18())
                .asCell()
                .equals(beginCell().storeUint(0b100010, 6).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice19())
                .asCell()
                .equals(beginCell().storeUint(0b100010, 6).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice20())
                .asCell()
                .equals(beginCell().storeUint(0b100010, 6).endCell()),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice21()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice22()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice23()).asCell().equals(Cell.EMPTY),
        ).toBe(true);
        expect(
            (await contract.getGetRawSlice24()).asCell().equals(Cell.EMPTY),
        ).toBe(true);

        // Check `ascii`
        expect(await contract.getGetAscii()).toBe(
            BigInt("0x68656c6c6f20776f726c64"),
        );
        expect(await contract.getGetAscii2()).toBe(
            BigInt("0x68656c6c6f20776f726c64"),
        );
        expect(await contract.getGetAscii3()).toBe(
            BigInt(
                "1563963554659859369353828835329962428465513941646011501275668087180532385",
            ),
        );
        expect(await contract.getGetAscii4()).toBe(
            BigInt(
                "1563963554659859369353828835329962428465513941646011501275668087180532385",
            ),
        );

        // Check `crc32`
        expect(await contract.getGetCrc32()).toBe(BigInt(2235694568));
        expect(await contract.getGetCrc32_2()).toBe(BigInt(2235694568));
        expect(await contract.getGetCrc32_3()).toBe(0n);
        expect(await contract.getGetCrc32_4()).toBe(0n);
    });
});
