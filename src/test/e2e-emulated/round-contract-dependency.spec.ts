import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

import { A } from "./contracts/output/round-contract-dependency_A";
import { B } from "./contracts/output/round-contract-dependency_B";
import { C } from "./contracts/output/round-contract-dependency_C";

import "@ton/test-utils";

describe("Diamond-shaped dependencies", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let contractA: SandboxContract<A>;
    let contractB: SandboxContract<B>;
    let contractC: SandboxContract<C>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        deployer = await blockchain.treasury("deployer");
        contractA = blockchain.openContract(await A.fromInit());
        contractB = blockchain.openContract(await B.fromInit());
        contractC = blockchain.openContract(await C.fromInit());

        // Deploy contracts
        await contractA.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );
        await contractB.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );
        await contractC.send(
            deployer.getSender(),
            { value: toNano("1") },
            null,
        );
    });

    it("Should work for A", async () => {
        const FirstAboutSecond = await contractA.getGetNext();

        expect(
            FirstAboutSecond.code.equals(contractB.init!.code!),
        ).toBeTruthy();
        expect(
            FirstAboutSecond.data.equals(contractB.init!.data!),
        ).toBeTruthy();

        const FirstAboutThird = await contractA.getGetNestedNext();
        expect(FirstAboutThird.code.equals(contractC.init!.code!)).toBeTruthy();
        expect(FirstAboutThird.data.equals(contractC.init!.data!)).toBeTruthy();
    });

    it("Should work for B", async () => {
        const SecondAboutThird = await contractB.getGetNext();

        expect(
            SecondAboutThird.code.equals(contractC.init!.code!),
        ).toBeTruthy();
        expect(
            SecondAboutThird.data.equals(contractC.init!.data!),
        ).toBeTruthy();

        const SecondAboutFirst = await contractB.getGetNestedNext();

        expect(
            SecondAboutFirst.code.equals(contractA.init!.code!),
        ).toBeTruthy();
        expect(
            SecondAboutFirst.data.equals(contractA.init!.data!),
        ).toBeTruthy();
    });

    it("Should work for C", async () => {
        const ThirdAboutFirst = await contractC.getGetNext();

        expect(ThirdAboutFirst.code.equals(contractA.init!.code!)).toBeTruthy();
        expect(ThirdAboutFirst.data.equals(contractA.init!.data!)).toBeTruthy();

        const ThirdAboutSecond = await contractC.getGetNestedNext();

        expect(
            ThirdAboutSecond.code.equals(contractB.init!.code!),
        ).toBeTruthy();
        expect(
            ThirdAboutSecond.data.equals(contractB.init!.data!),
        ).toBeTruthy();
    });
});
