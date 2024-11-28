import { Address, beginCell, Cell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { StdlibTest } from "./contracts/output/stdlib_StdlibTest";
import "@ton/test-utils";

describe("stdlib", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<StdlibTest>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await StdlibTest.fromInit());

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
    });

    it("should execute stdlib methods correctly", async () => {
        const slice = beginCell()
            .storeBit(1)
            .storeBit(1)
            .storeRef(beginCell().storeBit(1).endCell())
            .endCell()
            .asSlice();

        // Execute and verify slice methods
        expect(await contract.getSliceBits(slice)).toBe(2n);
        expect(await contract.getSliceRefs(slice)).toBe(1n);
        expect(await contract.getSliceEmpty(slice)).toBe(false);
        expect(await contract.getLoadBool(slice)).toBe(true);
        expect(await contract.getLoadBit(slice)).toBe(true);

        expect(
            (await contract.getStoreBool(beginCell(), true))
                .endCell()
                .toString(),
        ).toBe(beginCell().storeBit(true).endCell().toString());

        expect(
            (await contract.getStoreBit(beginCell(), true))
                .endCell()
                .toString(),
        ).toBe(beginCell().storeBit(true).endCell().toString());

        expect(await contract.getTvm_2023_07Upgrade()).toEqual(1455n);
        expect(await contract.getTvm_2024_04Upgrade()).toEqual(82009144n);

        expect(
            (
                await contract.getStoreMaybeRef(
                    beginCell(),
                    beginCell().storeUint(123, 64).endCell(),
                )
            ).endCell(),
        ).toEqualCell(
            beginCell()
                .storeMaybeRef(beginCell().storeUint(123, 64).endCell())
                .endCell(),
        );

        expect(
            (await contract.getStoreMaybeRef(beginCell(), null)).endCell(),
        ).toEqualCell(beginCell().storeMaybeRef(null).endCell());

        const addrStd = await contract.getParseStdAddress(
            beginCell()
                .storeAddress(
                    Address.parse(
                        "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
                    ),
                )
                .endCell()
                .asSlice(),
        );
        expect(addrStd.workchain).toBe(0n);
        expect(addrStd.address).toBe(
            BigInt(
                "0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
            ),
        );

        const addrVar = await contract.getParseVarAddress(
            beginCell()
                .storeUint(6, 3)
                .storeUint(123, 9)
                .storeUint(234, 32)
                .storeUint(345, 123)
                .endCell()
                .asSlice(),
        );
        expect(addrVar.workchain).toBe(234n);
        expect(addrVar.address.asCell()).toEqualCell(
            beginCell().storeUint(345, 123).endCell(),
        );

        expect(await contract.getBuilderDepth(beginCell())).toBe(0n);
        expect(
            await contract.getBuilderDepth(beginCell().storeRef(Cell.EMPTY)),
        ).toBe(1n);

        expect(await contract.getSkipLastBits(slice, 1n)).toEqualSlice(
            beginCell()
                .storeBit(1)
                .storeRef(beginCell().storeBit(1).endCell())
                .endCell()
                .asSlice(),
        );

        expect(await contract.getFirstBits(slice, 1n)).toEqualSlice(
            beginCell().storeBit(1).endCell().asSlice(),
        );

        expect(await contract.getLastBits(slice, 1n)).toEqualSlice(
            beginCell().storeBit(1).endCell().asSlice(),
        );

        expect(await contract.getSliceDepth(slice)).toBe(1n);

        expect(await contract.getAddressNone()).toEqual(null);

        expect(
            await contract.getComputeDataSizeCell(slice.asCell(), 1000n),
        ).toMatchObject({
            $$type: "DataSize",
            cells: 2n,
            bits: 3n,
            refs: 1n,
        });

        expect(
            await contract.getComputeDataSizeSlice(slice, 1000n),
        ).toMatchObject({
            $$type: "DataSize",
            cells: 1n, // -1 for slice
            bits: 3n,
            refs: 1n,
        });

        expect(await contract.getCellDepth(slice.asCell())).toBe(1n);

        expect(await contract.getCurLt()).toBe(0n);

        expect(await contract.getBlockLt()).toBe(0n);

        expect(await contract.getSetGasLimit(5000n)).toBe(3997n); // 5000 just to make sure it's enough, 3997 is how much it actually costs
        await expect(contract.getSetGasLimit(3996n)).rejects.toThrow("-14"); // 3996 gas is not enough for sure

        expect(await contract.getGetSeed()).toBe(0n);

        expect(await contract.getSetSeed(123n)).toBe(123n);

        expect(await contract.getMyCode()).toEqualCell(contract.init!.code);
    });
});
