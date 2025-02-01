import {
    beginCell,
    toNano,
    TransactionComputeVm,
    TransactionDescriptionGeneric,
} from "@ton/core";
import {
    Blockchain,
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Forward } from "./contracts/output/forward_Forward";
import { Functions } from "./contracts/output/functions_Functions";
import "@ton/test-utils";

function measureGas(txs: BlockchainTransaction[]) {
    return (
        (txs[1]!.description as TransactionDescriptionGeneric)
            .computePhase as TransactionComputeVm
    ).gasUsed;
}

describe("benchmarks", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("benchmarks");
    });

    it("benchmark functions", async () => {
        const functions = blockchain.openContract(await Functions.fromInit());

        const sendResult = await functions.send(
            treasure.getSender(),
            { value: toNano(1) },
            { $$type: "Add", value: 10n },
        );

        const gasUsed = measureGas(sendResult.transactions);

        expect(gasUsed).toMatchSnapshot("gas used");

        // Verify code size
        const codeSize = functions.init!.code.toBoc().length;
        expect(codeSize).toMatchSnapshot("code size");
    });

    it("benchmark readFwdFee", async () => {
        const testContract = blockchain.openContract(await Forward.fromInit());
        const sendResult = await testContract.send(
            treasure.getSender(),
            { value: toNano(1) },
            {
                $$type: "TestGetFwdFee",
                any: beginCell()
                    .storeUint(0, 32)
                    .storeStringTail("This is test payload")
                    .asSlice(),
            },
        );
        const gasUsed = measureGas(sendResult.transactions);
        expect(gasUsed).toMatchSnapshot("gas used");
        const codeSize = testContract.init!.code.toBoc().length;
        expect(codeSize).toMatchSnapshot("code size");
    });
});
