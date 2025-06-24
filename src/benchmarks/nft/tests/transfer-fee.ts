import type { Address, Cell } from "@ton/core";
import { beginCell } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import type { InitNFTBody } from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import {
    storeInitNFTBody,
    type NFTItem,
    InvalidFees,
} from "@/benchmarks/nft/tact/output/item_NFTItem";
import "@ton/test-utils";
import { step } from "@/test/allure/allure";
import { setStoragePrices } from "@/test/utils/gasUtils";
import { Storage, sendTransfer } from "@/benchmarks/nft/tests/utils";

const globalSetup = async (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    const blockchain = await Blockchain.create();
    const config = blockchain.config;
    blockchain.setConfig(
        setStoragePrices(config, {
            unixTimeSince: 0,
            bitPricePerSecond: 0n,
            cellPricePerSecond: 0n,
            masterChainBitPricePerSecond: 0n,
            masterChainCellPricePerSecond: 0n,
        }),
    );
    const owner = await blockchain.treasury("owner");

    const notOwner = await blockchain.treasury("notOwner");
    const emptyAddress = null;
    const defaultContent = beginCell().endCell();
    const itemNFT = blockchain.openContract(
        await fromInitItem(null, null, owner.address, 0n),
    );
    const deployItemMsg: InitNFTBody = {
        $$type: "InitNFTBody",
        owner: owner.address,
        content: defaultContent,
    };
    const deployResult = await itemNFT.send(
        owner.getSender(),
        { value: Storage.DeployAmount },
        beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice(),
    );
    await step(
        "Check that deployResult.transactions has correct transaction",
        () => {
            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                deploy: true,
                success: true,
            });
        },
    );

    const balance = await (
        await blockchain.getContract(itemNFT.address)
    ).balance;
    const fwdFee = Storage.ForwardFee.Base;
    const fwdFeeDouble = Storage.ForwardFee.Double;

    return {
        blockchain,
        itemNFT,
        owner,
        notOwner,
        defaultContent,
        emptyAddress,
        balance,
        fwdFee,
        fwdFeeDouble,
    };
};

export const testTransferFee = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    async function setup() {
        return await globalSetup(fromInitItem);
    }

    describe("Transfer ownership Fee cases", () => {
        // implementation detail
        it("should return error if forward amount is too much", async () => {
            const { itemNFT, owner, notOwner, emptyAddress } = await setup();

            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount,
            );
            await step(
                "Check that trxResult.transactions has correct transaction (transfer forward amount too much)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: Number(InvalidFees),
                    });
                },
            );
        });
        it("should return error if storage fee is not enough", async () => {
            const { itemNFT, owner, notOwner, emptyAddress, balance, fwdFee } =
                await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + fwdFee,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount + balance,
            );
            await step(
                "Check that trxResult.transactions has correct transaction (test transfer storage fee)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: Number(InvalidFees),
                    });
                },
            );
        });
        it("should work with 2 fwdFee on balance", async () => {
            const {
                balance,
                fwdFee,
                itemNFT,
                owner,
                notOwner,
                emptyAddress,
                blockchain,
            } = await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + Storage.MinTons + fwdFee,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount + balance,
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: true,
            });
            await step(
                "Check that trxResult.transactions has correct transaction (test transfer forward fee 2.0)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: true,
                    });
                },
            );
            const newBalance = await (
                await blockchain.getContract(itemNFT.address)
            ).balance;
            await step(
                "Check that balance is less than Storage.MinTons (test transfer forward fee 2.0)",
                () => {
                    expect(newBalance).toBeLessThan(Storage.MinTons);
                },
            );
        });
        it("should work with 1 fwdFee on balance", async () => {
            const { itemNFT, owner, notOwner, emptyAddress, balance } =
                await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + Storage.ForwardFee.Base,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount + balance - Storage.MinTons,
                beginCell()
                    .storeUint(1, 1)
                    .storeStringTail("testing")
                    .asSlice(),
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: true,
            });
            await step(
                "Check that trxResult.transactions has correct transaction (test transfer forward fee single)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: true,
                    });
                },
            );
        });
    });
};

export const testTransferForwardFeeDouble = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    describe("Transfer forward fee double cases", function () {
        const setup = async () => {
            return await globalSetup(fromInitItem);
        };
        it("should false with only one fwd fee on balance", async () => {
            const { itemNFT, owner, notOwner, balance, fwdFeeDouble } =
                await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + fwdFeeDouble,
                notOwner.address,
                owner.address,
                Storage.TransferAmount + balance - Storage.MinTons,
                beginCell()
                    .storeUint(1, 1)
                    .storeStringTail("testing")
                    .asSlice(),
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: false,
                exitCode: Number(InvalidFees),
            });
            await step(
                "Check that trxResult.transactions has correct transaction (double forward fee, not enough for both)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: Number(InvalidFees),
                    });
                },
            );
        });
        it("should work with 2 fwdFee on balance", async () => {
            const {
                itemNFT,
                owner,
                notOwner,
                balance,
                fwdFeeDouble,
                blockchain,
            } = await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + 2n * fwdFeeDouble,
                notOwner.address,
                owner.address,
                Storage.TransferAmount + balance - Storage.MinTons,
                beginCell()
                    .storeUint(1, 1)
                    .storeStringTail("testing")
                    .asSlice(),
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: true,
            });
            const newBalance = await (
                await blockchain.getContract(itemNFT.address)
            ).balance;
            expect(newBalance).toBeLessThan(Storage.MinTons);
            await step(
                "Check that trxResult.transactions has correct transaction (double forward fee, enough for both)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: true,
                    });
                },
            );
            await step(
                "Check that balance is less than Storage.MinTons (double forward fee)",
                () => {
                    expect(newBalance).toBeLessThan(Storage.MinTons);
                },
            );
        });
    });
};
