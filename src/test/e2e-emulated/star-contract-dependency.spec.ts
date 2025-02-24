import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

import { Parent } from "./contracts/output/star-contract-dependency_Parent";
import { Child0 } from "./contracts/output/star-contract-dependency_Child0";
import { Child1 } from "./contracts/output/star-contract-dependency_Child1";
import { Child2 } from "./contracts/output/star-contract-dependency_Child2";
import { Child3 } from "./contracts/output/star-contract-dependency_Child3";
import { Child4 } from "./contracts/output/star-contract-dependency_Child4";
import { Child5 } from "./contracts/output/star-contract-dependency_Child5";
import { Child6 } from "./contracts/output/star-contract-dependency_Child6";
import { Child7 } from "./contracts/output/star-contract-dependency_Child7";
import { Child8 } from "./contracts/output/star-contract-dependency_Child8";
import { Child9 } from "./contracts/output/star-contract-dependency_Child9";

import "@ton/test-utils";

describe("Diamond-shaped dependencies", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let ParentContract: SandboxContract<Parent>;
    let child0Contract: SandboxContract<Child0>;
    let child1Contract: SandboxContract<Child1>;
    let child2Contract: SandboxContract<Child2>;
    let child3Contract: SandboxContract<Child3>;
    let child4Contract: SandboxContract<Child4>;
    let child5Contract: SandboxContract<Child5>;
    let child6Contract: SandboxContract<Child6>;
    let child7Contract: SandboxContract<Child7>;
    let child8Contract: SandboxContract<Child8>;
    let child9Contract: SandboxContract<Child9>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        deployer = await blockchain.treasury("deployer");
        ParentContract = blockchain.openContract(await Parent.fromInit());
        child0Contract = blockchain.openContract(await Child0.fromInit());
        child1Contract = blockchain.openContract(await Child1.fromInit());
        child2Contract = blockchain.openContract(await Child2.fromInit());
        child3Contract = blockchain.openContract(await Child3.fromInit());
        child4Contract = blockchain.openContract(await Child4.fromInit());
        child5Contract = blockchain.openContract(await Child5.fromInit());
        child6Contract = blockchain.openContract(await Child6.fromInit());
        child7Contract = blockchain.openContract(await Child7.fromInit());
        child8Contract = blockchain.openContract(await Child8.fromInit());
        child9Contract = blockchain.openContract(await Child9.fromInit());
        const deployResult = await ParentContract.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            deploy: true,
        });
    });

    it("should work for Parent", async () => {
        const ParentAboutChild0 = await ParentContract.getGetChild0();
        expect(
            ParentAboutChild0.code.equals(child0Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild0.data.equals(child0Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild1 = await ParentContract.getGetChild1();
        expect(
            ParentAboutChild1.code.equals(child1Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild1.data.equals(child1Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild2 = await ParentContract.getGetChild2();
        expect(
            ParentAboutChild2.code.equals(child2Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild2.data.equals(child2Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild3 = await ParentContract.getGetChild3();
        expect(
            ParentAboutChild3.code.equals(child3Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild3.data.equals(child3Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild4 = await ParentContract.getGetChild4();
        expect(
            ParentAboutChild4.code.equals(child4Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild4.data.equals(child4Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild5 = await ParentContract.getGetChild5();
        expect(
            ParentAboutChild5.code.equals(child5Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild5.data.equals(child5Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild6 = await ParentContract.getGetChild6();
        expect(
            ParentAboutChild6.code.equals(child6Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild6.data.equals(child6Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild7 = await ParentContract.getGetChild7();
        expect(
            ParentAboutChild7.code.equals(child7Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild7.data.equals(child7Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild8 = await ParentContract.getGetChild8();
        expect(
            ParentAboutChild8.code.equals(child8Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild8.data.equals(child8Contract.init!.data!),
        ).toBeTruthy();

        const ParentAboutChild9 = await ParentContract.getGetChild9();
        expect(
            ParentAboutChild9.code.equals(child9Contract.init!.code!),
        ).toBeTruthy();
        expect(
            ParentAboutChild9.data.equals(child9Contract.init!.data!),
        ).toBeTruthy();
    });
    it("should work for Child", async () => {
        // Let's pick the 5th
        const deployChild5 = await child5Contract.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );
        expect(deployChild5.transactions).toHaveTransaction({
            from: deployer.address,
            deploy: true,
        });
        const ChildAboutParent = await child5Contract.getGetParent();
        expect(
            ChildAboutParent.code.equals(ParentContract.init!.code!),
        ).toBeTruthy();
        expect(
            ChildAboutParent.data.equals(ParentContract.init!.data!),
        ).toBeTruthy();
    });
});
