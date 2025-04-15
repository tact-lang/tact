import "@ton/test-utils";
import type { Address } from "@ton/core";
import { Cell, beginCell, toNano, contractAddress, SendMode } from "@ton/core";

import type { Sender } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import {
    generateResults,
    getStateSizeForAccount,
    generateCodeSizeResults,
    getUsedGas,
    printBenchmarkTable,
    type BenchmarkResult,
    type CodeSizeResult,
} from "@/benchmarks/utils/gas";
import { join, resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import { type Step, writeLog } from "@/test/utils/write-vm-log";
import { Escrow } from "@/benchmarks/contracts/output/escrow_Escrow";
import type {
    UpdateJettonWalletCode,
    Funding,
    Approve,
    Cancel,
} from "@/benchmarks/contracts/output/escrow_Escrow";

import benchmarkResults from "@/benchmarks/escrow/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/escrow/results_code_size.json";

const loadFunCEscrowBoc = () => {
    const bocEscrow = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/escrow.boc"),
        ),
    );

    return { bocEscrow };
};

type Implementation = "func" | "tact";

describe("Escrow Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let seller: SandboxContract<TreasuryContract>;
    let buyer: SandboxContract<TreasuryContract>;
    let guarantor: SandboxContract<TreasuryContract>;
    let lastCtxId = 1n;

    const jettonWalletCode = beginCell().storeUint(0, 1).endCell();

    let step: Step;
    const results = generateResults(benchmarkResults);
    const codeSizeResults = generateCodeSizeResults(benchmarkCodeSizeResults);
    const expectedCodeSize = codeSizeResults.at(-1)!;
    const funcCodeSize = codeSizeResults.at(0)!;

    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    const dealAmount = toNano(1);

    async function deployContract(
        implementation: Implementation,
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ): Promise<SandboxContract<Escrow>> {
        if (implementation === "func") {
            const escrowData = loadFunCEscrowBoc();
            const escrowCell = Cell.fromBoc(escrowData.bocEscrow)[0]!;

            const stateInitEscrowBuilder = beginCell()
                .storeUint(lastCtxId++, 32)
                .storeAddress(seller.address)
                .storeAddress(guarantor.address)
                .storeUint(dealAmount, 64)
                .storeAddress(assetAddress);

            const cell2 = beginCell()
                .storeUint(royalty, 32)
                .storeAddress(null)
                .storeUint(0, 2)
                .storeMaybeRef(assetAddress ? jettonWalletCode : null)
                .endCell();

            const stateInit = stateInitEscrowBuilder.storeRef(cell2).endCell();

            const init = { code: escrowCell, data: stateInit };
            const escrowAddress = contractAddress(0, init);

            const escrowContract = blockchain.openContract(
                await Escrow.fromAddress(escrowAddress),
            );

            const deployResult = await deployer.send({
                to: escrowAddress,
                value: toNano("0.1"),
                init,
                body: beginCell().endCell(),
                sendMode: SendMode.PAY_GAS_SEPARATELY,
            });

            expect(deployResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: escrowAddress,
                success: true,
                deploy: true,
            });

            return escrowContract;
        } else {
            const contractInit = await Escrow.fromInit(
                lastCtxId++,
                seller.address,
                guarantor.address,
                null,
                dealAmount,
                royalty,
                false,
                assetAddress,
                assetAddress ? jettonWalletCode : null,
            );

            const contract = blockchain.openContract(contractInit);

            const deployResult = await contract.send(
                deployer.getSender(),
                { value: toNano("0.1") },
                {
                    $$type: "ProvideEscrowData",
                },
            );

            expect(deployResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: contract.address,
                success: true,
                deploy: true,
            });

            return contract;
        }
    }

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        deployer = await blockchain.treasury("deployer");
        seller = await blockchain.treasury("seller");
        buyer = await blockchain.treasury("buyer");
        guarantor = await blockchain.treasury("guarantor");

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });
    });

    afterAll(() => {
        printBenchmarkTable(results, codeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });

    const sendFunding = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
    ) => {
        const msg: Funding = {
            $$type: "Funding",
        };

        return await escrowContract.send(from, { value }, msg);
    };

    const sendChangeCode = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
        newCode: Cell,
    ) => {
        const msg: UpdateJettonWalletCode = {
            $$type: "UpdateJettonWalletCode",
            newJettonWalletCode: newCode,
        };

        return await escrowContract.send(from, { value }, msg);
    };

    const sendApprove = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
    ) => {
        const msg: Approve = {
            $$type: "Approve",
        };

        return await escrowContract.send(from, { value }, msg);
    };

    const sendCancel = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
    ) => {
        const msg: Cancel = {
            $$type: "Cancel",
        };

        return await escrowContract.send(from, { value }, msg);
    };

    const implementationsGas: [Implementation, BenchmarkResult][] = [
        ["func", funcResult],
        ["tact", expectedResult],
    ];

    const implementationsCodeSize: [Implementation, CodeSizeResult][] = [
        ["func", funcCodeSize],
        ["tact", expectedCodeSize],
    ];

    it.each(implementationsGas)("fundingTon - %s", async (name, result) => {
        const contract = await deployContract(name, null, dealAmount, 1n);

        const sendResult = await step("fundingTon", async () =>
            sendFunding(contract, buyer.getSender(), toNano(1)),
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(result.gas["fundingTon"]);
    });

    it.each(implementationsGas)("changeCode - %s", async (name, result) => {
        const contract = await deployContract(
            name,
            guarantor.address,
            dealAmount,
            1n,
        );
        const newCode = beginCell().endCell();

        const sendResult = await step("changeCode", async () =>
            sendChangeCode(
                contract,
                seller.getSender(),
                toNano("0.05"),
                newCode,
            ),
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(result.gas["changeCode"]);
    });

    it.each(implementationsGas)("approveTon - %s", async (name, result) => {
        const contract = await deployContract(name, null, dealAmount, 1n);

        await contract.send(
            buyer.getSender(),
            { value: toNano(1) },
            {
                $$type: "Funding",
            },
        );

        const sendResult = await step("approveTon", async () =>
            sendApprove(contract, guarantor.getSender(), toNano("0.05")),
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(result.gas["approveTon"]);
    });

    it.each(implementationsGas)("cancelTon - %s", async (name, result) => {
        const contract = await deployContract(name, null, dealAmount, 1n);

        await contract.send(
            buyer.getSender(),
            { value: toNano(1) },
            {
                $$type: "Funding",
            },
        );

        const sendResult = await step("cancelTon", async () =>
            sendCancel(contract, guarantor.getSender(), toNano("0.05")),
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(result.gas["cancelTon"]);
    });

    it.each(implementationsCodeSize)(
        "cells - %s",
        async (name, sizeResults) => {
            const contract = await deployContract(name, null, dealAmount, 1n);

            expect(
                (await getStateSizeForAccount(blockchain, contract.address))
                    .cells,
            ).toEqual(sizeResults.size["cells"]);
        },
    );

    it.each(implementationsCodeSize)("bits - %s", async (name, sizeResults) => {
        const contract = await deployContract(name, null, dealAmount, 1n);

        expect(
            (await getStateSizeForAccount(blockchain, contract.address)).bits,
        ).toEqual(sizeResults.size["bits"]);
    });
});
