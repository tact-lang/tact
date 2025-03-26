import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { Address } from "@ton/core";
import { beginCell, Cell, contractAddress, SendMode, toNano } from "@ton/core";
import "@ton/test-utils";

import type { UpdateJettonWalletCode } from "../contracts/output/escrow_Escrow";
import {
    Escrow,
    storeApprove,
    storeCancel,
    storeFunding,
    storeUpdateJettonWalletCode,
} from "../contracts/output/escrow_Escrow";
import {
    getUsedGas,
    generateResults,
    printBenchmarkTable,
    generateCodeSizeResults,
    getStateSizeForAccount,
} from "../utils/gas";
import benchmarkResults from "./results_gas.json";
import { readFileSync } from "fs";
import { posixNormalize } from "../../utils/filePath";
import { resolve } from "path";
import benchmarkCodeSizeResults from "./results_code_size.json";

const loadFunCEscrowBoc = () => {
    const bocEscrow = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/escrow.boc"),
        ),
    );

    return { bocEscrow };
};

const sendFundingRaw = async (
    escrowAddress: Address,
    via: SandboxContract<TreasuryContract>,
    amount: bigint,
) => {
    const fundingMsg = beginCell()
        .store(
            storeFunding({
                $$type: "Funding",
            }),
        )
        .endCell();

    return await via.send({
        to: escrowAddress,
        value: amount,
        body: fundingMsg,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const sendChangeCodeRaw = async (
    escrowAddress: Address,
    via: SandboxContract<TreasuryContract>,
    newCode: Cell,
) => {
    const changeCode: UpdateJettonWalletCode = {
        $$type: "UpdateJettonWalletCode",
        newJettonWalletCode: newCode,
    };

    const changeCodeMsg = beginCell()
        .store(storeUpdateJettonWalletCode(changeCode))
        .endCell();

    return await via.send({
        to: escrowAddress,
        value: toNano("0.05"),
        body: changeCodeMsg,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const sendApproveRaw = async (
    escrowAddress: Address,
    via: SandboxContract<TreasuryContract>,
) => {
    const approveMsg = beginCell()
        .store(
            storeApprove({
                $$type: "Approve",
            }),
        )
        .endCell();

    return await via.send({
        to: escrowAddress,
        value: toNano("0.05"),
        body: approveMsg,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const sendCancelRaw = async (
    escrowAddress: Address,
    via: SandboxContract<TreasuryContract>,
) => {
    const cancelMsg = beginCell()
        .store(
            storeCancel({
                $$type: "Cancel",
            }),
        )
        .endCell();

    return await via.send({
        to: escrowAddress,
        value: toNano("0.05"),
        body: cancelMsg,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

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
    const funcResult = results.at(0)!;

    const codeSizeResults = generateCodeSizeResults(benchmarkCodeSizeResults);
    const expectedCodeSize = codeSizeResults.at(-1)!;
    const funcCodeSize = codeSizeResults.at(0)!;

    async function deployEscrowContractTact(
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ) {
        const contract = blockchain.openContract(
            await Escrow.fromInit(
                lastCtxId++,
                seller.address,
                guarantor.address,
                null,
                dealAmount,
                royalty,
                false,
                assetAddress,
                assetAddress ? stubJettonWalletCode : null,
            ),
        );

        const deployResult = await contract.send(
            deployer.getSender(),
            {
                value: toNano("0.1"),
            },
            {
                $$type: "ProvideEscrowData",
            },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: contract.address,
            value: toNano("0.1"),
            success: true,
            deploy: true,
        });

        return {
            escrowAddress: contract.address,
            result: deployResult,
        };
    }

    async function deployEscrowContractFunC(
        assetAddress: Address | null,
        dealAmount: bigint,
        royalty: bigint,
    ) {
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
            .storeMaybeRef(assetAddress ? stubJettonWalletCode : null)
            .endCell();

        const stateInit = stateInitEscrowBuilder.storeRef(cell2).endCell();

        const init = { code: escrowCell, data: stateInit };

        const escrowAddress = contractAddress(0, init);

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
            value: toNano("0.1"),
            success: true,
            deploy: true,
        });

        return {
            escrowAddress,
            result: deployResult,
        };
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
        printBenchmarkTable(results, codeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });

    it("fundingTon", async () => {
        const runFundingTest = async (escrowAddress: Address) => {
            const fundingResult = await sendFundingRaw(
                escrowAddress,
                buyer,
                toNano(1),
            );

            expect(fundingResult.transactions).toHaveTransaction({
                from: buyer.address,
                to: escrowAddress,
                value: toNano(1),
                success: true,
                exitCode: 0,
            });

            return getUsedGas(fundingResult, "internal");
        };

        const dealAmount = toNano(1); // 1 ton

        const escrowContractFunC = await deployEscrowContractFunC(
            null,
            dealAmount,
            1n,
        );

        const escrowContractTact = await deployEscrowContractTact(
            null,
            dealAmount,
            1n,
        );

        const fundingGasFunC = await runFundingTest(
            escrowContractFunC.escrowAddress,
        );

        const fundingGasTact = await runFundingTest(
            escrowContractTact.escrowAddress,
        );

        expect(fundingGasFunC).toEqual(funcResult.gas["fundingTon"]);
        expect(fundingGasTact).toEqual(expectedResult.gas["fundingTon"]);
    });

    it("changeCode", async () => {
        const runChangeCodeTest = async (escrowAddress: Address) => {
            const changeCodeResult = await sendChangeCodeRaw(
                escrowAddress,
                seller,
                beginCell().endCell(),
            );

            expect(changeCodeResult.transactions).toHaveTransaction({
                from: seller.address,
                to: escrowAddress,
                success: true,
                exitCode: 0,
            });

            return getUsedGas(changeCodeResult, "internal");
        };

        const dealAmount = toNano(1); // 1 ton

        const escrowContractFunC = await deployEscrowContractFunC(
            guarantor.address,
            dealAmount,
            1n,
        );

        const escrowContractTact = await deployEscrowContractTact(
            guarantor.address,
            dealAmount,
            1n,
        );

        const changeCodeGasFunC = await runChangeCodeTest(
            escrowContractFunC.escrowAddress,
        );

        const changeCodeGasTact = await runChangeCodeTest(
            escrowContractTact.escrowAddress,
        );

        expect(changeCodeGasFunC).toEqual(funcResult.gas["changeCode"]);
        expect(changeCodeGasTact).toEqual(expectedResult.gas["changeCode"]);
    });

    it("approveTon", async () => {
        const runApproveTest = async (escrowAddress: Address) => {
            await sendFundingRaw(escrowAddress, buyer, toNano(1));

            const approveResult = await sendApproveRaw(
                escrowAddress,
                guarantor,
            );

            expect(approveResult.transactions).toHaveTransaction({
                from: guarantor.address,
                to: escrowAddress,
                success: true,
                destroyed: true,
                exitCode: 0,
            });

            return getUsedGas(approveResult, "internal");
        };

        const dealAmount = toNano(1); // 1 ton

        const escrowContractFunC = await deployEscrowContractFunC(
            null,
            dealAmount,
            1n,
        );

        const escrowContractTact = await deployEscrowContractTact(
            null,
            dealAmount,
            1n,
        );

        const approveGasFunC = await runApproveTest(
            escrowContractFunC.escrowAddress,
        );

        const approveGasTact = await runApproveTest(
            escrowContractTact.escrowAddress,
        );

        expect(approveGasFunC).toEqual(funcResult.gas["approveTon"]);
        expect(approveGasTact).toEqual(expectedResult.gas["approveTon"]);
    });

    it("cancelTon", async () => {
        const runCancelTest = async (escrowAddress: Address) => {
            await sendFundingRaw(escrowAddress, buyer, toNano(1));
            const cancelResult = await sendCancelRaw(escrowAddress, guarantor);

            expect(cancelResult.transactions).toHaveTransaction({
                from: guarantor.address,
                to: escrowAddress,
                success: true,
                destroyed: true,
                exitCode: 0,
            });

            return getUsedGas(cancelResult, "internal");
        };

        const dealAmount = toNano(1); // 1 ton

        const escrowContractFunC = await deployEscrowContractFunC(
            null,
            dealAmount,
            1n,
        );

        const escrowContractTact = await deployEscrowContractTact(
            null,
            dealAmount,
            1n,
        );

        const cancelGasFunC = await runCancelTest(
            escrowContractFunC.escrowAddress,
        );

        const cancelGasTact = await runCancelTest(
            escrowContractTact.escrowAddress,
        );

        expect(cancelGasFunC).toEqual(funcResult.gas["cancelTon"]);
        expect(cancelGasTact).toEqual(expectedResult.gas["cancelTon"]);
    });

    it("cells", async () => {
        const escrowContractFunC = await deployEscrowContractFunC(
            null,
            toNano(1),
            1n,
        );

        const escrowContractTact = await deployEscrowContractTact(
            null,
            toNano(1),
            1n,
        );

        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractFunC.escrowAddress,
                )
            ).cells,
        ).toEqual(funcCodeSize.size["cells"]);

        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractTact.escrowAddress,
                )
            ).cells,
        ).toEqual(expectedCodeSize.size["cells"]);
    });

    it("bits", async () => {
        const escrowContractFunC = await deployEscrowContractFunC(
            null,
            toNano(1),
            1n,
        );

        const escrowContractTact = await deployEscrowContractTact(
            null,
            toNano(1),
            1n,
        );

        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractFunC.escrowAddress,
                )
            ).bits,
        ).toEqual(funcCodeSize.size["bits"]);

        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    escrowContractTact.escrowAddress,
                )
            ).bits,
        ).toEqual(expectedCodeSize.size["bits"]);
    });
});
