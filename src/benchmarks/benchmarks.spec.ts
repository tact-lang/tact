import {
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
        expect(gasUsed).toMatchInlineSnapshot(`3648n`);

        // Verify code size
        const codeSize = functions.init!.code.toBoc().length;
        expect(codeSize).toMatchInlineSnapshot(`281`);
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
        expect(gasUsed).toMatchInlineSnapshot(`3517n`);

        // Verify code size
        const codeSize = functionsInline.init!.code.toBoc().length;
        expect(codeSize).toMatchInlineSnapshot(`274`);
    });
});
