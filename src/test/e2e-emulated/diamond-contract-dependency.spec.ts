import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

import { NoDependencies } from "./contracts/output/diamond-contract-dependency_NoDependencies";
import { OneDependency } from "./contracts/output/diamond-contract-dependency_OneDependency";
import { TwoDependencies } from "./contracts/output/diamond-contract-dependency_TwoDependencies";
import "@ton/test-utils";

describe("Diamond-shaped dependencies", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let noDepsContract: SandboxContract<NoDependencies>;
    let firstOneDepContract: SandboxContract<OneDependency>;
    let secondOneDepContract: SandboxContract<OneDependency>;
    let twoDepsContract: SandboxContract<TwoDependencies>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        deployer = await blockchain.treasury("deployer");

        noDepsContract = blockchain.openContract(
            await NoDependencies.fromInit(),
        );
        firstOneDepContract = blockchain.openContract(
            await OneDependency.fromInit(0n),
        );
        secondOneDepContract = blockchain.openContract(
            await OneDependency.fromInit(1n),
        );
        twoDepsContract = blockchain.openContract(
            await TwoDependencies.fromInit(),
        );

        await noDepsContract.send(
            deployer.getSender(),
            { value: toNano("10") },
            null,
        );

        await firstOneDepContract.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );

        await secondOneDepContract.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );

        await twoDepsContract.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );
    });
    it("Should work 1", async () => {
        const actualNoDeps = await noDepsContract.getGetState();

        const firstOneDepAboutNoDeps = await firstOneDepContract.getGetDep();

        const secondOneDepAboutNoDeps = await secondOneDepContract.getGetDep();

        // No deps is correct about itself
        expect(actualNoDeps.code.equals(noDepsContract.init!.code!)).toBe(true);
        expect(actualNoDeps.data.equals(noDepsContract.init!.data!)).toBe(true);

        // First dep is correct about no deps
        expect(
            firstOneDepAboutNoDeps.code.equals(noDepsContract.init!.code!),
        ).toBe(true);
        expect(
            firstOneDepAboutNoDeps.data.equals(noDepsContract.init!.data!),
        ).toBe(true);

        // Second dep is correct about no deps
        expect(
            secondOneDepAboutNoDeps.code.equals(noDepsContract.init!.code!),
        ).toBe(true);
        expect(
            secondOneDepAboutNoDeps.data.equals(noDepsContract.init!.data!),
        ).toBe(true);
    });
    it("Should work 2", async () => {
        const actualFirstOneDep = await firstOneDepContract.getGetState();

        const twoDepsAboutFirstOneDep = await twoDepsContract.getGetFirstDep();

        // First dep is correct about itself
        expect(
            actualFirstOneDep.code.equals(firstOneDepContract.init!.code!),
        ).toBe(true);
        expect(
            actualFirstOneDep.data.equals(firstOneDepContract.init!.data!),
        ).toBe(true);

        // Two deps is correct about first dep
        expect(
            twoDepsAboutFirstOneDep.code.equals(
                firstOneDepContract.init!.code!,
            ),
        ).toBe(true);
        expect(
            twoDepsAboutFirstOneDep.data.equals(
                firstOneDepContract.init!.data!,
            ),
        ).toBe(true);

        // Two deps is correct about no deps

        const twoDepsAboutNoDeps = await twoDepsContract.getGetNoDep();

        expect(twoDepsAboutNoDeps.code.equals(noDepsContract.init!.code!)).toBe(
            true,
        );
        expect(twoDepsAboutNoDeps.data.equals(noDepsContract.init!.data!)).toBe(
            true,
        );
    });
});
