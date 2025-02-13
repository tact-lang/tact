import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { Address } from "@ton/core";
import { beginCell, toNano } from "@ton/core";
import "@ton/test-utils";

import { Escrow } from "../contracts/output/escrow_Escrow";
import { getUsedGas, generateResults, printBenchmarkTable } from "../util";
import benchmarkResults from "./results.json";

describe("Escrow Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;

    let seller: SandboxContract<TreasuryContract>;
    let buyer: SandboxContract<TreasuryContract>;
    let guarantor: SandboxContract<TreasuryContract>;
    let lastCtxId = 1n;

    const stubJettonWalletCode = beginCell().storeUint(0, 1).endCell();
    const results = generateResults(benchmarkResults);
    const expectedResult = results.at(-1)!;

    async function generateEscrowContract(
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ) {
        return blockchain.openContract(
            await Escrow.fromInit(
                lastCtxId++,
                seller.address,
                guarantor.address,
                dealAmount,
                royalty,
                assetAddress,
                assetAddress ? stubJettonWalletCode : null,
            ),
        );
    }

    // each new escrow deal is new contract instance
    beforeEach(async () => {
        blockchain = await Blockchain.create();

        deployer = await blockchain.treasury("deployer");
        seller = await blockchain.treasury("seller");
        buyer = await blockchain.treasury("buyer");
        guarantor = await blockchain.treasury("guarantor");
    });

    afterAll(() => {
        printBenchmarkTable(results);
    });

    it("send ton funding", async () => {
        const dealAmount = toNano(1); // 1 ton

        const escrowContract = await generateEscrowContract(
            null,
            dealAmount,
            1n,
        );

        await escrowContract.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        const fundingResult = await escrowContract.send(
            buyer.getSender(),
            {
                value: dealAmount,
            },
            "funding",
        );

        expect(fundingResult.transactions).toHaveTransaction({
            from: buyer.address,
            to: escrowContract.address,
            value: dealAmount,
            success: true,
            exitCode: 0,
        });

        const gasUsed = getUsedGas(fundingResult);
        expect(gasUsed).toEqual(expectedResult.gas["fundingTon"]);
    });

    it("update jetton wallet code", async () => {
        const dealAmount = toNano(5); // 5 jetton

        const escrowContract = await generateEscrowContract(
            guarantor.address,
            dealAmount,
            1n,
        );

        await escrowContract.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        const newJettonWalletCode = beginCell().endCell();

        const updateResult = await escrowContract.send(
            seller.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "UpdateJettonWalletCode",
                newJettonWalletCode: newJettonWalletCode, // example cell
            },
        );

        expect(updateResult.transactions).toHaveTransaction({
            from: seller.address,
            to: escrowContract.address,
            success: true,
        });

        const gasUsed = getUsedGas(updateResult);
        expect(gasUsed).toEqual(expectedResult.gas["changeCode"]);
    });

    it("guarantor approve ton", async () => {
        const dealAmount = toNano(1); // 1 ton

        const escrowContract = await generateEscrowContract(
            null,
            dealAmount,
            1n,
        );

        await escrowContract.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        await escrowContract.send(
            buyer.getSender(),
            {
                value: dealAmount,
            },
            "funding",
        );

        const approveResult = await escrowContract.send(
            guarantor.getSender(),
            {
                value: toNano("0.05"),
            },
            "approve",
        );

        expect(approveResult.transactions).toHaveTransaction({
            from: guarantor.address,
            to: escrowContract.address,
            success: true,
            outMessagesCount: 2,
            endStatus: "non-existing", // escrow should be destroyed after cancel
        });

        const gasUsed = getUsedGas(approveResult);
        expect(gasUsed).toEqual(expectedResult.gas["approveTon"]);
    });

    it("guarantor cancel ton", async () => {
        const dealAmount = toNano(1); // 1 ton

        const escrowContract = await generateEscrowContract(
            null,
            dealAmount,
            1n,
        );

        await escrowContract.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        await escrowContract.send(
            buyer.getSender(),
            {
                value: dealAmount,
            },
            "funding",
        );

        const cancelResult = await escrowContract.send(
            guarantor.getSender(),
            {
                value: toNano("0.05"),
            },
            "cancel",
        );

        expect(cancelResult.transactions).toHaveTransaction({
            from: guarantor.address,
            to: escrowContract.address,
            success: true,
            endStatus: "non-existing", // escrow should be destroyed after cancel
        });

        const gasUsed = getUsedGas(cancelResult);
        expect(gasUsed).toEqual(expectedResult.gas["cancelTon"]);
    });
});
