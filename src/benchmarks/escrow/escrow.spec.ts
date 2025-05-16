import "@ton/test-utils";
import type { Address, Sender } from "@ton/core";
import { beginCell, Cell, contractAddress, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import {
    type BenchmarkResult,
    type CodeSizeResult,
    generateCodeSizeResults,
    generateResults,
    getStateSizeForAccount,
    getUsedGas,
    printBenchmarkTable,
} from "@/benchmarks/utils/gas";
import { resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import type {
    Approve,
    Cancel,
    Funding,
    UpdateJettonWalletCode,
} from "@/benchmarks/escrow/tact/output/escrow_Escrow";
import { Escrow } from "@/benchmarks/escrow/tact/output/escrow_Escrow";

import benchmarkResults from "@/benchmarks/escrow/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/escrow/results_code_size.json";
import { attachment, parameter, step } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

const loadFunCEscrowBoc = () => {
    const bocEscrow = readFileSync(
        posixNormalize(resolve(__dirname, "./func/output/escrow.boc")),
    );

    return { bocEscrow };
};

function testEscrow(
    benchmarkResults: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInit: (
        id: bigint,
        sellerAddress: Address,
        guarantorAddress: Address,
        buyerAddress: Address | null,
        dealAmount: bigint,
        guarantorRoyaltyPercent: bigint,
        isFunded: boolean,
        assetAddress: Address | null,
        jettonWalletCode: Cell | null,
    ) => Promise<Escrow>,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let seller: SandboxContract<TreasuryContract>;
    let buyer: SandboxContract<TreasuryContract>;
    let guarantor: SandboxContract<TreasuryContract>;
    let lastCtxId = 1n;

    const jettonWalletCode = beginCell().storeUint(0, 1).endCell();

    const dealAmount = toNano(1);

    async function deployContract(
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ): Promise<SandboxContract<Escrow>> {
        const contractInit = await fromInit(
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

        const contract = await step("Open contract", () => {
            return blockchain.openContract(contractInit);
        });

        const deployResult = await step(
            "Send 'ProvideEscrowData'",
            async () => {
                return await contract.send(
                    deployer.getSender(),
                    { value: toNano("0.1") },
                    {
                        $$type: "ProvideEscrowData",
                    },
                );
            },
        );

        await step("Should have deploy transaction", () => {
            expect(deployResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: contract.address,
                success: true,
                deploy: true,
            });
        });

        return contract;
    }

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        deployer = await blockchain.treasury("deployer");
        seller = await blockchain.treasury("seller");
        buyer = await blockchain.treasury("buyer");
        guarantor = await blockchain.treasury("guarantor");

        await parameter("deployer", deployer.address.toString());
        await parameter("seller", seller.address.toString());
        await parameter("buyer", buyer.address.toString());
        await parameter("guarantor", guarantor.address.toString());
    });

    const sendFunding = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
    ) => {
        const msg: Funding = {
            $$type: "Funding",
        };

        return await step("sendFunding", async () => {
            await attachment("value", value.toString(), ContentType.TEXT);
            return await escrowContract.send(from, { value }, msg);
        });
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

        return await step("sendChangeCode", async () => {
            await attachment("value", value.toString(), ContentType.TEXT);
            return await escrowContract.send(from, { value }, msg);
        });
    };

    const sendApprove = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
    ) => {
        const msg: Approve = {
            $$type: "Approve",
        };

        return await step("sendApprove", async () => {
            await attachment("value", value.toString(), ContentType.TEXT);
            return await escrowContract.send(from, { value }, msg);
        });
    };

    const sendCancel = async (
        escrowContract: SandboxContract<Escrow>,
        from: Sender,
        value: bigint,
    ) => {
        const msg: Cancel = {
            $$type: "Cancel",
        };

        return await step("sendCancel", async () => {
            await attachment("value", value.toString(), ContentType.TEXT);
            return await escrowContract.send(from, { value }, msg);
        });
    };

    it("fundingTon", async () => {
        const contract = await deployContract(null, dealAmount, 1n);

        const sendResult = await step("fundingTon", async () =>
            sendFunding(contract, buyer.getSender(), toNano(1)),
        );

        await step("Should not fail transaction", () => {
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        await step("Gas used should match benchmark", () => {
            expect(gasUsed).toEqual(benchmarkResults.gas["fundingTon"]);
        });
    });

    it("changeCode", async () => {
        const contract = await deployContract(
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

        await step("Should not fail transaction", () => {
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        await step("Gas used should match benchmark", () => {
            expect(gasUsed).toEqual(benchmarkResults.gas["changeCode"]);
        });
    });

    it("approveTon", async () => {
        const contract = await deployContract(null, dealAmount, 1n);

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

        await step("Should not fail transaction", () => {
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        await step("Gas used should match benchmark", () => {
            expect(gasUsed).toEqual(benchmarkResults.gas["approveTon"]);
        });
    });

    it("cancelTon", async () => {
        const contract = await deployContract(null, dealAmount, 1n);

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

        await step("Should not fail transaction", () => {
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        await step("Gas used should match benchmark", () => {
            expect(gasUsed).toEqual(benchmarkResults.gas["cancelTon"]);
        });
    });

    it("cells", async () => {
        const contract = await deployContract(null, dealAmount, 1n);

        await step("Cell size should match benchmark", async () => {
            expect(
                (await getStateSizeForAccount(blockchain, contract.address))
                    .cells,
            ).toEqual(codeSizeResults.size["cells"]);
        });
    });

    it("bits", async () => {
        const contract = await deployContract(null, dealAmount, 1n);
        await step("Bit size should match benchmark", async () => {
            expect(
                (await getStateSizeForAccount(blockchain, contract.address))
                    .bits,
            ).toEqual(codeSizeResults.size["bits"]);
        });
    });
}

describe("Escrow Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);
    const fullCodeSizeResults = generateCodeSizeResults(
        benchmarkCodeSizeResults,
    );

    describe("func", () => {
        const funcCodeSize = fullCodeSizeResults.at(0)!;
        const funcResult = fullResults.at(0)!;

        function fromInit(
            id: bigint,
            sellerAddress: Address,
            guarantorAddress: Address,
            buyerAddress: Address | null,
            dealAmount: bigint,
            guarantorRoyaltyPercent: bigint,
            isFunded: boolean,
            assetAddress: Address | null,
            jettonWalletCode: Cell | null,
        ) {
            const __code = Cell.fromBoc(loadFunCEscrowBoc().bocEscrow)[0]!;
            const cell1 = beginCell()
                .storeUint(id, 32)
                .storeAddress(sellerAddress)
                .storeAddress(guarantorAddress)
                .storeUint(dealAmount, 64)
                .storeAddress(assetAddress);

            const cell2 = beginCell()
                .storeUint(guarantorRoyaltyPercent, 32)
                .storeAddress(buyerAddress)
                .storeUint(isFunded ? 1 : 0, 2)
                .storeMaybeRef(assetAddress ? jettonWalletCode : null)
                .endCell();
            const __data = cell1.storeRef(cell2).endCell();
            const __gen_init = { code: __code, data: __data };
            const address = contractAddress(0, __gen_init);
            return Promise.resolve(new Escrow(address, __gen_init));
        }

        testEscrow(funcResult, funcCodeSize, fromInit);
    });

    describe("tact", () => {
        const tactCodeSize = fullCodeSizeResults.at(-1)!;
        const tactResult = fullResults.at(-1)!;
        testEscrow(tactResult, tactCodeSize, Escrow.fromInit.bind(Escrow));
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, fullCodeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
