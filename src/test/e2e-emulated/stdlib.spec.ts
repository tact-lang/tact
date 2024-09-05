import { beginCell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { StdlibTest } from "./contracts/output/stdlib_StdlibTest";
import "@ton/test-utils";

describe("stdlib", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<StdlibTest>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
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

        expect(await contract.getTvm_2023_07Upgrade()).toEqual(1355n);
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
    });
});
