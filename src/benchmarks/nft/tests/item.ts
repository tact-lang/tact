import { Address, type Cell } from "@ton/core";
import { beginCell } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type {
    GetStaticData,
    InitNFTBody,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import {
    storeInitNFTBody,
    type NFTItem,
    IncorrectForwardPayload, 
    IncorrectDeployer,
} from "@/benchmarks/nft/tact/output/item_NFTItem";
import "@ton/test-utils";
import { setStoragePrices } from "@/test/utils/gasUtils";
import { step } from "@/test/allure/allure";
import {
    Storage,
    ErrorCodes,
    getItemOwner,
    sendTransfer,
} from "@/benchmarks/nft/tests/utils";

const messageGetStaticData = async (
    sender: SandboxContract<TreasuryContract>,
    itemNFT: SandboxContract<NFTItem>,
) => {
    const msg: GetStaticData = {
        $$type: "GetStaticData",
        queryId: 1n,
    };
    const trxResult = await itemNFT.send(
        sender.getSender(),
        { value: Storage.DeployAmount },
        msg,
    );
    return trxResult;
};

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

    const notInitItem = blockchain.openContract(
        await fromInitItem(null, null, owner.address, 1n),
    );

    await messageGetStaticData(owner, notInitItem); // deploy in sandbox 

    return {
        blockchain,
        itemNFT,
        owner,
        notOwner,
        defaultContent,
        emptyAddress,
        notInitItem,
    };
};


const testGetStaticData = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    const setup = async () => {
        return await globalSetup(fromInitItem);
    };

    describe("Get Static Data", () => {
        it("should get static data correctly", async () => {
            const { itemNFT, owner } = await setup();
            const trxResult = await messageGetStaticData(owner, itemNFT);
            await step(
                "Check that trxResult.transactions has correct transaction (get static data)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: true,
                    });
                },
            );
        });
        it("should throw exit code if nft not initialized", async () => {
            const { notInitItem, owner } = await setup();
            const trxResult = await messageGetStaticData(owner, notInitItem);
            await step(
                "Check that trxResult.transactions has correct transaction (not initialized)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: notInitItem.address,
                        success: false,
                        exitCode: ErrorCodes.NotInit,
                    });
                },
            );
        });
    });
};

const testGetNftData = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    const setup = async () => {
        return await globalSetup(fromInitItem);
    };

    describe("Get Nft Data", () => {
        it("should get nft data correctly when item is initialized", async () => {
            const { itemNFT, owner, defaultContent } = await setup();

            const staticData = await itemNFT.getGetNftData();
            await step("Check that staticData.init is -1", () => {
                expect(staticData.init).toBe(-1n);
            });
            await step("Check that staticData.itemIndex is 0", () => {
                expect(staticData.itemIndex).toBe(0n);
            });
            await step(
                "Check that staticData.collectionAddress equals owner.address",
                () => {
                    expect(staticData.collectionAddress).toEqualAddress(
                        owner.address,
                    );
                },
            );
            await step(
                "Check that staticData.owner equals owner.address",
                () => {
                    expect(staticData.owner).toEqualAddress(owner.address);
                },
            );
            await step(
                "Check that staticData.content equals defaultContent",
                () => {
                    expect(staticData.content).toEqualCell(defaultContent);
                },
            );
        });

        it("should get nft data correctly when item is not initialized", async () => {
            const { notInitItem, owner } = await setup();

            const staticData = await notInitItem.getGetNftData();

            await step("Check that staticData.init is 0", () => {
                expect(staticData.init).toBe(0n);
            });

            await step("Check that staticData.itemIndex is 1", () => {
                expect(staticData.itemIndex).toBe(1n);
            });

            await step(
                "Check that staticData.collectionAddress equals owner.address",
                () => {
                    expect(staticData.collectionAddress).toEqualAddress(
                        owner.address,
                    );
                },
            );

            await step(
                "Check that staticData.owner equals owner.address",
                () => {
                    expect(staticData.owner).toEqual(null);
                },
            );
            await step(
                "Check that staticData.content equals defaultContent",
                () => {
                    expect(staticData.content).toEqual(null);
                },
            );
        });
    });
};

const testDeploy = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    const setup = async () => {
        return await globalSetup(fromInitItem);
    };

    describe("Deploy", () => {
        it("should deploy correctly", async () => {
            await setup();
        });

        it("should throw exit code if item is already initialized", async () => {
            const { itemNFT, owner, defaultContent } = await setup();

            const deployItemMsg: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultContent,
            };

            const trxResult = await itemNFT.send(
                owner.getSender(),
                { value: Storage.DeployAmount },
                beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice(),
            );

            await step(
                "Check that trxResult.transactions has correct transaction (item is already initialized)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: ErrorCodes.InvalidData,
                    });
                },
            );
        });

        it("should throw exit code if deploy not from collection", async () => {
            const { notInitItem, notOwner, defaultContent } = await setup();

            const deployItemMsg: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: notOwner.address,
                content: defaultContent,
            };
        
            const deployResult = await notInitItem.send(
                notOwner.getSender(),
                { value: Storage.DeployAmount },
                beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice(),
            );

            await step(
                "Check that trxResult.transactions has correct transaction (deploy not from collection)",
                () => {
                    expect(deployResult.transactions).toHaveTransaction({
                        from: notOwner.address,
                        to: notInitItem.address,
                        success: false,
                        exitCode: Number(IncorrectDeployer),
                    });
                },
            );
        });
    });
};

const testTransfer = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    const setup = async () => {
        return await globalSetup(fromInitItem);
    };

    describe("Transfer", () => {
        it("should throw exit code if item is not initialized", async () => {
            const { notInitItem, owner } = await setup();
            const trxResult = await sendTransfer(
                notInitItem,
                owner.getSender(),
                Storage.DeployAmount,
                owner.address,
                null,
                0n,
            );
            await step(
                "Check that trxResult.transactions has correct transaction (item is not initialized)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: notInitItem.address,
                        success: false,
                        exitCode: ErrorCodes.NotInit,
                    });
                },
            );
        });

        it("should return error if not owner tries to transfer ownership", async () => {
            const { itemNFT, notOwner, emptyAddress } = await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                notOwner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                emptyAddress,
                0n,
            );
            await step(
                "Check that trxResult.transactions has correct transaction (not owner should not be able to transfer ownership)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: notOwner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: ErrorCodes.NotOwner,
                    });
                },
            );
        });

        it("should throw exit code if forward payload is less than 1", async () => {
            const { itemNFT, owner } = await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                owner.address,
                null,
                0n,
                beginCell().asSlice(),
            );

            await step(
                "Check that trxResult.transactions has correct transaction (forward payload is less than 1)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: Number(IncorrectForwardPayload),
                    });
                },
            );
        });

        it("should throw exit code if newOwner isnot from basechain", async () => {
            const { itemNFT, owner } = await setup();
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                Address.parse(
                    "Ef8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAU",
                ),
                null,
                0n,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (newOwner is not from basechain)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: false,
                        exitCode: ErrorCodes.InvalidDestinationWorkchain,
                    });
                },
            );
        });

        it("should assign ownership correctly", async () => {
            const { itemNFT, owner, notOwner } = await setup();
            const oldOwner = await getItemOwner(itemNFT);
            await step("Check that oldOwner equals owner.address", () => {
                expect(oldOwner).toEqualAddress(owner.address);
            });
            const trxRes = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                owner.address,
                1n,
            );
            const newOwner = await getItemOwner(itemNFT);
            await step("Check that newOwner equals notOwner.address", () => {
                expect(newOwner).toEqualAddress(notOwner.address);
            });
            await step(
                "Check that trxRes.transactions has correct transaction (ownership assigned)",
                () => {
                    expect(trxRes.transactions).toHaveTransaction({
                        from: owner.address,
                        to: itemNFT.address,
                        success: true,
                    });
                },
            );
        });
        it("should transfer ownership without any messages", async () => {
            const { itemNFT, owner, notOwner, emptyAddress } = await setup();
            const trxRes = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                emptyAddress,
                0n,
            );
            const newOwner = await getItemOwner(itemNFT);
            await step(
                "Check that newOwner equals notOwner.address (no messages)",
                () => {
                    expect(newOwner).toEqualAddress(notOwner.address);
                },
            );
            await step(
                "Check that trxRes.transactions does NOT have transaction from itemNFT.address (no messages)",
                () => {
                    expect(trxRes.transactions).not.toHaveTransaction({
                        from: itemNFT.address,
                    });
                },
            );
        });
    });
};

export const testItem = (
    fromInitItem: (
        owner: Address | null,
        content: Cell | null,
        collectionAddress: Address,
        itemIndex: bigint,
    ) => Promise<NFTItem>,
) => {
    describe("NFT Item Contract", () => {
        testGetStaticData(fromInitItem);
        testGetNftData(fromInitItem);
        testDeploy(fromInitItem);
        testTransfer(fromInitItem);
    });
};