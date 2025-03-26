import type {
    TransactionComputeVm,
    TransactionDescriptionGeneric,
} from "@ton/core";
import { beginCell, toNano } from "@ton/core";
import type {
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import "@ton/test-utils";
import { getUsedGas } from "../../benchmarks/utils/gas";
import type { Step } from "../utils/write-vm-log";
import { writeLog } from "../utils/write-vm-log";
import { join } from "path";
import { Functions } from "./contracts/output/functions_Functions";
import { Forward } from "./contracts/output/forward_Forward";
import { Sha256Small } from "./contracts/output/benchmark_sha256_small_Sha256Small";
import { Sha256Big } from "./contracts/output/benchmark_sha256_big_Sha256Big";
import { Sha256AsSlice } from "./contracts/output/benchmark_sha256_as_slice_Sha256AsSlice";
import { CellsCreation } from "./contracts/output/cells_CellsCreation";
import { Addresses } from "./contracts/output/address_Addresses";
import { CodeOfVsInitOf } from "./contracts/output/codeOf_CodeOfVsInitOf";
import { WithDeploy } from "./contracts/output/deploy_WithDeploy";
import { WithoutDeploy } from "./contracts/output/deploy_WithoutDeploy";

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

    let step: Step;

    beforeAll(async () => {
        blockchain = await Blockchain.create();

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });
    });

    beforeEach(async () => {
        treasure = await blockchain.treasury("benchmarks");
    });

    it("benchmark functions", async () => {
        const functions = blockchain.openContract(await Functions.fromInit());

        const sendResult = await step("benchmark functions", () =>
            functions.send(
                treasure.getSender(),
                { value: toNano(1) },
                { $$type: "Add", value: 10n },
            ),
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

        return getUsedGas(result, "internal");
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

        return getUsedGas(result, "internal");
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

        return getUsedGas(result, "internal");
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

        expect(await hashStringBig(sha256Big, "hello world")).toMatchSnapshot(
            "gas hash string big",
        );
        expect(
            await hashStringSmall(sha256Small, "hello world"),
        ).toMatchSnapshot("gas hash string small");
        expect(
            await hashStringAsSLice(sha256AsSlice, "hello world"),
        ).toMatchSnapshot("gas hash string slice");

        expect(
            await hashStringBig(sha256Big, "hello world".repeat(5)),
        ).toMatchSnapshot("gas hash string big repeated");
        expect(
            await hashStringSmall(sha256Small, "hello world".repeat(5)),
        ).toMatchSnapshot("gas hash string small repeated");
        expect(
            await hashStringAsSLice(sha256AsSlice, "hello world".repeat(5)),
        ).toMatchSnapshot("gas hash string slice repeated");

        expect(
            await hashStringBig(sha256Big, "hello world".repeat(10)),
        ).toMatchSnapshot("gas hash string big repeated more");
        expect(
            await hashStringSmall(sha256Small, "hello world".repeat(10)),
        ).toMatchSnapshot("gas hash string small repeated more");
        expect(
            await hashStringAsSLice(sha256AsSlice, "hello world".repeat(10)),
        ).toMatchSnapshot("gas hash string slice repeated more");
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

    it("benchmark contractAddressExt", async () => {
        const testContract = blockchain.openContract(
            await Addresses.fromInit(),
        );
        await testContract.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );
        const gasUsed = (
            await blockchain.runGetMethod(
                testContract.address,
                "contractAddressExt",
            )
        ).gasUsed;
        expect(gasUsed).toMatchSnapshot("gas used contractAddressExt");
    });

    it("benchmark codeOf vs initOf", async () => {
        const testContract = blockchain.openContract(
            await CodeOfVsInitOf.fromInit(),
        );
        await testContract.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );
        const gasUsed = (
            await blockchain.runGetMethod(testContract.address, "withCodeOf")
        ).gasUsed;
        expect(gasUsed).toMatchSnapshot("gas used withCodeOf");

        const gasUsed2 = (
            await blockchain.runGetMethod(testContract.address, "withInitOf")
        ).gasUsed;
        expect(gasUsed2).toMatchSnapshot("gas used withInitOf");
    });

    it("benchmark codeOf vs myCode()", async () => {
        const testContract = blockchain.openContract(
            await CodeOfVsInitOf.fromInit(),
        );
        await testContract.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );
        const gasUsed = (
            await blockchain.runGetMethod(testContract.address, "codeOfSelf")
        ).gasUsed;
        expect(gasUsed).toMatchSnapshot("gas used codeOf for current contract");

        const gasUsed2 = (
            await blockchain.runGetMethod(testContract.address, "myCode")
        ).gasUsed;
        expect(gasUsed2).toMatchSnapshot("gas used myCode");
    });

    it("benchmark deployable trait vs raw deploy", async () => {
        const withDeployTrait = blockchain.openContract(
            await WithDeploy.fromInit(),
        );
        const withoutDeploy = blockchain.openContract(
            await WithoutDeploy.fromInit(),
        );

        const deployResultTrait = await withDeployTrait.send(
            treasure.getSender(),
            { value: toNano(1) },
            {
                $$type: "Deploy",
                queryId: 1n,
            },
        );

        const deployRawResult = await withoutDeploy.send(
            treasure.getSender(),
            { value: toNano(1) },
            beginCell().endCell().beginParse(),
        );

        const gasUsed = measureGas(deployResultTrait.transactions);
        expect(gasUsed).toMatchSnapshot("gas used deploy trait");

        const gasUsedRaw = measureGas(deployRawResult.transactions);
        expect(gasUsedRaw).toMatchSnapshot("gas used raw deploy");
    });
});
