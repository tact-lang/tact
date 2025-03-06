import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { ExitCodesParent } from "./contracts/output/exit-codes-parent_ExitCodesParent";
import { ExitCodesChild as SameProjectChild } from "./contracts/output/exit-codes-parent_ExitCodesChild";
import { ExitCodesChild as SeparatedChild } from "./contracts/output/exit-codes-child_ExitCodesChild";
import "@ton/test-utils";

describe("exit-codes", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let parent: SandboxContract<ExitCodesParent>;
    let childSameProj: SandboxContract<SameProjectChild>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        parent = blockchain.openContract(await ExitCodesParent.fromInit());
        childSameProj = blockchain.openContract(
            await SameProjectChild.fromInit(),
        );

        const deployResult = await parent.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: parent.address,
            success: true,
            deploy: true,
        });
    });

    it("abi should be correct", async () => {
        const parentProvider = blockchain.getContract(parent.address);
        const firstExitCode = ExitCodesParent.errors["first"];
        const realFirstExitCode = (
            await (await parentProvider).get("firstExitCode")
        ).exitCode;
        expect(realFirstExitCode).toBe(firstExitCode);

        const secondExitCode = ExitCodesParent.errors["second"];
        const realSecondExitCode = (
            await (await parentProvider).get("secondExitCode")
        ).exitCode;
        expect(realSecondExitCode).toBe(secondExitCode);

        const childProvider = blockchain.getContract(childSameProj.address);
        const childExitCode = SameProjectChild.errors["second"];
        const realChildExitCode = (
            await (await childProvider).get("secondExitCode")
        ).exitCode;
        expect(realChildExitCode).toBe(childExitCode);
    });

    it("should be same in same project", () => {
        const firstParentExitCode = ExitCodesParent.errors["first"];
        const secondParentExitCode = ExitCodesParent.errors["second"];
        const childExitCode = SameProjectChild.errors["second"];

        expect(
            new Set([firstParentExitCode, secondParentExitCode, childExitCode]),
        ).toEqual(new Set([1024, 1025]));
    });

    it("should be different in different projects", () => {
        const parentExitCode = ExitCodesParent.errors["second"];
        const separateExitCode = SeparatedChild.errors["second"];
        expect(separateExitCode).toBe(1024);

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        expect(parentExitCode === 1024 || parentExitCode === 1025).toBe(true);
    });
});
