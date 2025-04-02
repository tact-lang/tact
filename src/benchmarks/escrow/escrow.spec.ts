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
    ProvideEscrowData,
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

describe("Escrow Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let seller: SandboxContract<TreasuryContract>;
    let buyer: SandboxContract<TreasuryContract>;
    let guarantor: SandboxContract<TreasuryContract>;
    let lastCtxId = 1n;

    let escrowContractFunC: SandboxContract<Escrow>;
    let escrowContractTact: SandboxContract<Escrow>;

    const jettonWalletCode = beginCell().storeUint(0, 1).endCell();

    let step: Step;
    const results = generateResults(benchmarkResults);
    const codeSizeResults = generateCodeSizeResults(benchmarkCodeSizeResults);
    const expectedCodeSize = codeSizeResults.at(-1)!;
    const funcCodeSize = codeSizeResults.at(0)!;

    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    const dealAmount = toNano(1);

    async function deployFuncContract(
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ): Promise<SandboxContract<Escrow>> {
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

        await deployer.send({
            to: escrowAddress,
            value: toNano("0.1"),
            init,
            body: beginCell().endCell(),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });

        return escrowContract;
    }

    async function deployTactContract(
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ): Promise<SandboxContract<Escrow>> {
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

        await contract.send(deployer.getSender(), { value: toNano("0.1") }, {
            $$type: "ProvideEscrowData",
        } as ProvideEscrowData);

        return contract;
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

    beforeEach(async () => {
        escrowContractFunC = await deployFuncContract(null, dealAmount, 1n);

        escrowContractTact = await deployTactContract(null, dealAmount, 1n);
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

    it("fundingTon", async () => {
        const runFundingTest = async (
            escrowContract: SandboxContract<Escrow>,
        ) => {
            const sendResult = await step("fundingTon", async () =>
                sendFunding(escrowContract, buyer.getSender(), toNano(1)),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const fundingGasUsedFunC = await runFundingTest(escrowContractFunC);
        const fundingGasUsedTact = await runFundingTest(escrowContractTact);

        expect(fundingGasUsedFunC).toEqual(funcResult.gas["fundingTon"]);
        expect(fundingGasUsedTact).toEqual(expectedResult.gas["fundingTon"]);
    });

    it("changeCode", async () => {
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

        const runChangeCodeTest = async (
            escrowContract: SandboxContract<Escrow>,
        ) => {
            const newCode = beginCell().endCell();

            const sendResult = await step("changeCode", async () =>
                sendChangeCode(
                    escrowContract,
                    seller.getSender(),
                    toNano("0.05"),
                    newCode,
                ),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        escrowContractFunC = await deployFuncContract(
            guarantor.address,
            dealAmount,
            1n,
        );

        escrowContractTact = await deployTactContract(
            guarantor.address,
            dealAmount,
            1n,
        );

        const changeCodeGasUsedFunC =
            await runChangeCodeTest(escrowContractFunC);
        const changeCodeGasUsedTact =
            await runChangeCodeTest(escrowContractTact);

        expect(changeCodeGasUsedFunC).toEqual(funcResult.gas["changeCode"]);
        expect(changeCodeGasUsedTact).toEqual(expectedResult.gas["changeCode"]);
    });

    it("approveTon", async () => {
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

        const runApproveTest = async (
            escrowContract: SandboxContract<Escrow>,
        ) => {
            await escrowContract.send(buyer.getSender(), { value: toNano(1) }, {
                $$type: "Funding",
            } as Funding);

            const sendResult = await step("approveTon", async () =>
                sendApprove(
                    escrowContract,
                    guarantor.getSender(),
                    toNano("0.05"),
                ),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const approveGasUsedFunC = await runApproveTest(escrowContractFunC);
        const approveGasUsedTact = await runApproveTest(escrowContractTact);

        expect(approveGasUsedFunC).toEqual(funcResult.gas["approveTon"]);
        expect(approveGasUsedTact).toEqual(expectedResult.gas["approveTon"]);
    });

    it("cancelTon", async () => {
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

        const runCancelTest = async (
            escrowContract: SandboxContract<Escrow>,
        ) => {
            await escrowContract.send(buyer.getSender(), { value: toNano(1) }, {
                $$type: "Funding",
            } as Funding);

            const sendResult = await step("cancelTon", async () =>
                sendCancel(
                    escrowContract,
                    guarantor.getSender(),
                    toNano("0.05"),
                ),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const cancelGasUsedFunC = await runCancelTest(escrowContractFunC);
        const cancelGasUsedTact = await runCancelTest(escrowContractTact);

        expect(cancelGasUsedFunC).toEqual(funcResult.gas["cancelTon"]);
        expect(cancelGasUsedTact).toEqual(expectedResult.gas["cancelTon"]);
    });

    it("cells", async () => {
        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractFunC.address,
                )
            ).cells,
        ).toEqual(funcCodeSize.size["cells"]);

        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractTact.address,
                )
            ).cells,
        ).toEqual(expectedCodeSize.size["cells"]);
    });

    it("bits", async () => {
        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractFunC.address,
                )
            ).bits,
        ).toEqual(funcCodeSize.size["bits"]);

        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractTact.address,
                )
            ).bits,
        ).toEqual(expectedCodeSize.size["bits"]);
    });
});
