import {
    beginCell,
    toNano,
    TransactionComputeVm,
    TransactionDescriptionGeneric,
} from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Functions } from "./contracts/output/benchmark_functions_Functions";
import { Functions as FunctionsInline } from "./contracts/output/benchmark_functions_inline_Functions";
import "@ton/test-utils";

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

        const gasUsed = (
            (
                sendResult.transactions[1]!
                    .description as TransactionDescriptionGeneric
            ).computePhase as TransactionComputeVm
        ).gasUsed;
        expect(gasUsed).toMatchInlineSnapshot(`2869n`);

        // Verify code size
        const codeSize = functions.init!.code.toBoc().length;
        expect(codeSize).toMatchInlineSnapshot(`260`);
    });

    it("benchmark functions (inline)", async () => {
        const functionsInline = blockchain.openContract(
            await FunctionsInline.fromInit(),
        );

        const sendResult = await functionsInline.send(
            treasure.getSender(),
            { value: toNano(1) },
            { $$type: "Add", value: 10n },
        );

        const gasUsed = (
            (
                sendResult.transactions[1]!
                    .description as TransactionDescriptionGeneric
            ).computePhase as TransactionComputeVm
        ).gasUsed;
        expect(gasUsed).toMatchInlineSnapshot(`2738n`);

        // Verify code size
        const codeSize = functionsInline.init!.code.toBoc().length;
        expect(codeSize).toMatchInlineSnapshot(`220`);
    });
    it("benchmark readFwdFee", async () => {
        const testContract = blockchain.openContract(
            await Functions.fromInit(),
        );
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
        const gasUsed = (
            (
                sendResult.transactions[1]!
                    .description as TransactionDescriptionGeneric
            ).computePhase as TransactionComputeVm
        ).gasUsed;
        expect(gasUsed).toMatchInlineSnapshot(`2973n`);
        const codeSize = testContract.init!.code.toBoc().length;
        expect(codeSize).toMatchInlineSnapshot(`260`);
    });
});
