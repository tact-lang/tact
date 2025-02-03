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
import { Functions } from "./contracts/output/functions_Functions";
import { Sha256 } from "./contracts/output/benchmark_sha256_Sha256";
import { Forward } from "./contracts/output/forward_Forward";
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

    async function hashString(
        sha256: SandboxContract<Sha256>,
        s: string,
        method: "HashBig" | "HashSmall",
    ): Promise<bigint> {
        const result = await sha256.send(
            treasure.getSender(),
            { value: toNano(1) },
            { $$type: method, value: s },
        );

        return measureGas(result.transactions);
    }

    it("benchmark sha256", async () => {
        const sha256 = blockchain.openContract(await Sha256.fromInit());

        await sha256.send(treasure.getSender(), { value: toNano(1) }, null);
        await hashString(sha256, "hello world", "HashBig");
        await hashString(sha256, "hello world", "HashSmall");

        expect(await hashString(sha256, "hello world", "HashBig")).toEqual(
            2766n,
        );
        expect(await hashString(sha256, "hello world", "HashSmall")).toEqual(
            2410n,
        );

        expect(
            await hashString(sha256, "hello world".repeat(5), "HashBig"),
        ).toEqual(2767n);
        expect(
            await hashString(sha256, "hello world".repeat(5), "HashSmall"),
        ).toEqual(2410n);

        expect(
            await hashString(sha256, "hello world".repeat(10), "HashBig"),
        ).toEqual(2769n);
        expect(
            await hashString(sha256, "hello world".repeat(10), "HashSmall"),
        ).toEqual(2410n);
    });
});
