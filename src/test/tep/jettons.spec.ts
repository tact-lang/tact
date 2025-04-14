import "@ton/test-utils";
import type { JettonUpdateContent } from "@/benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import { JettonMinter } from "@/benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import { JettonWallet } from "@/benchmarks/contracts/output/jetton-wallet_JettonWallet";
import type { Address } from "@ton/core";
import { beginCell, toNano } from "@ton/core";
import type {
    BlockchainSnapshot,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

describe("tep-74 tests", () => {
    let blockchain: Blockchain;
    let jettonMinter: SandboxContract<JettonMinter>;
    let deployer: SandboxContract<TreasuryContract>;

    let userWallet: (
        address: Address,
    ) => Promise<SandboxContract<JettonWallet>>;

    let snapshot: BlockchainSnapshot;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        deployer = await blockchain.treasury("deployer");

        const defaultContent = beginCell().endCell();
        const msg: JettonUpdateContent = {
            $$type: "JettonUpdateContent",
            queryId: 0n,
            content: defaultContent,
        };

        jettonMinter = blockchain.openContract(
            await JettonMinter.fromInit(0n, deployer.address, defaultContent),
        );

        const deployResult = await jettonMinter.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            msg,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonMinter.address,
            deploy: true,
            success: true,
        });

        userWallet = async (address: Address) => {
            return blockchain.openContract(
                new JettonWallet(
                    await jettonMinter.getGetWalletAddress(address),
                ),
            );
        };

        snapshot = blockchain.snapshot();
    });

    beforeEach(async () => {
        await blockchain.loadFrom(snapshot);
    });

    it("Should correctly handle response destination as addr_none", async () => {
        const deployerJettonWallet = await userWallet(deployer.address);

        const burnResult = await deployerJettonWallet.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            {
                $$type: "JettonBurn",
                queryId: 0n,
                amount: 0n,
                customPayload: null,
                responseDestination: deployer.address,
            },
        );

        // excesses from burn
        expect(burnResult.transactions).toHaveTransaction({
            from: jettonMinter.address,
            to: deployer.address,
        });

        const burnResultWithoutExcesses = await deployerJettonWallet.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            {
                $$type: "JettonBurn",
                queryId: 0n,
                amount: 0n, // let's burn 0 jettons, it won't affect balance, but we still can check if excesses are sent
                customPayload: null,
                responseDestination: null, // tep allows this, excesses shouldn't be sent
            },
        );

        expect(burnResultWithoutExcesses.transactions).not.toHaveTransaction({
            from: jettonMinter.address,
        });
    });
});
