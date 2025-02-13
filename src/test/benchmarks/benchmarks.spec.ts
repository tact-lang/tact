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
import { Sha256Small } from "./contracts/output/benchmark_sha256_small_Sha256Small";
import { Sha256Big } from "./contracts/output/benchmark_sha256_big_Sha256Big";
import { Sha256AsSlice } from "./contracts/output/benchmark_sha256_as_slice_Sha256AsSlice";
import { Forward } from "./contracts/output/forward_Forward";
import "@ton/test-utils";
import { CellsCreation } from "./contracts/output/cells_CellsCreation";
import { getUsedGas } from "./util";

function measureGas(txs: BlockchainTransaction[]): number {
    return Number(
        (
            (txs[1]!.description as TransactionDescriptionGeneric)
                .computePhase as TransactionComputeVm
        ).gasUsed,
    );
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

    async function hashStringSmall(
        sha256: SandboxContract<Sha256Small>,
        s: string,
    ): Promise<number> {
        const result = await sha256.send(
            treasure.getSender(),
            { value: toNano(1) },
            { $$type: "HashData", value: s },
        );

        return getUsedGas(result);
    }

    async function hashStringBig(
        sha256: SandboxContract<Sha256Big>,
        s: string,
    ): Promise<number> {
        const result = await sha256.send(
            treasure.getSender(),
            { value: toNano(1) },
            { $$type: "HashData", value: s },
        );

        return getUsedGas(result);
    }

    async function hashStringAsSLice(
        sha256: SandboxContract<Sha256AsSlice>,
        s: string,
    ): Promise<number> {
        const result = await sha256.send(
            treasure.getSender(),
            { value: toNano(1) },
            { $$type: "HashData", value: s },
        );

        return getUsedGas(result);
    }

    it("benchmark sha256", async () => {
        const sha256Small = blockchain.openContract(
            await Sha256Small.fromInit(),
        );
        const sha256Big = blockchain.openContract(await Sha256Big.fromInit());
        const sha256AsSlice = blockchain.openContract(
            await Sha256AsSlice.fromInit(),
        );

        await sha256Small.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );
        await sha256Big.send(treasure.getSender(), { value: toNano(1) }, null);
        await sha256AsSlice.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );

        await hashStringBig(sha256Big, "hello world");
        await hashStringSmall(sha256Small, "hello world");
        await hashStringAsSLice(sha256AsSlice, "hello world");

        expect(await hashStringBig(sha256Big, "hello world")).toEqual(3039);
        expect(await hashStringSmall(sha256Small, "hello world")).toEqual(2516);
        expect(await hashStringAsSLice(sha256AsSlice, "hello world")).toEqual(
            2516,
        );

        expect(await hashStringBig(sha256Big, "hello world".repeat(5))).toEqual(
            3040,
        );
        expect(
            await hashStringSmall(sha256Small, "hello world".repeat(5)),
        ).toEqual(2516);
        expect(
            await hashStringAsSLice(sha256AsSlice, "hello world".repeat(5)),
        ).toEqual(2516);

        expect(
            await hashStringBig(sha256Big, "hello world".repeat(10)),
        ).toEqual(3042);
        expect(
            await hashStringSmall(sha256Small, "hello world".repeat(10)),
        ).toEqual(2516);
        expect(
            await hashStringAsSLice(sha256AsSlice, "hello world".repeat(10)),
        ).toEqual(2516);
    });

    it("benchmark cells creation", async () => {
        const testContract = blockchain.openContract(
            await CellsCreation.fromInit(),
        );
        await testContract.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );

        const gasUsed1 = (
            await blockchain.runGetMethod(testContract.address, "emptyCell")
        ).gasUsed;
        expect(gasUsed1).toMatchSnapshot("gas used emptyCell");

        const gasUsed2 = (
            await blockchain.runGetMethod(testContract.address, "emptySlice")
        ).gasUsed;
        expect(gasUsed2).toMatchSnapshot("gas used emptySlice");
    });
});
