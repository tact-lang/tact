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
        //blockchain.verbosity.vmLogs = "vm_logs_verbose";
        deployer = await blockchain.treasury("deployer");
        contractA = blockchain.openContract(await A.fromInit());
        contractB = blockchain.openContract(await B.fromInit());
        contractC = blockchain.openContract(await C.fromInit());

        // Deploy contracts
        await contractA.send(deployer.getSender(), { value: toNano("1") }, null);
        await contractB.send(deployer.getSender(), { value: toNano("1") }, null);
        await contractC.send(deployer.getSender(), { value: toNano("1") }, null);
    });

    it("Should work for A", async () => {

        const AaboutB = await contractA.getGetNext();

        expect(AaboutB.code.equals(contractB.init!.code!)).toBeTruthy();
        expect(AaboutB.data.equals(contractB.init!.data!)).toBeTruthy();

        const AaboutC = await contractA.getGetNestedNext();
        expect(AaboutC.code.equals(contractC.init!.code!)).toBeTruthy();
        expect(AaboutC.data.equals(contractC.init!.data!)).toBeTruthy();
    });

    it("Should work for B", async () => {
        const BaboutC = await contractB.getGetNext();

        expect(BaboutC.code.equals(contractC.init!.code!)).toBeTruthy();
        expect(BaboutC.data.equals(contractC.init!.data!)).toBeTruthy();

        const BaboutA = await contractB.getGetNestedNext();

        expect(BaboutA.code.equals(contractA.init!.code!)).toBeTruthy();
        expect(BaboutA.data.equals(contractA.init!.data!)).toBeTruthy();
    });

    it("Should work for C", async () => {

        const CaboutA = await contractC.getGetNext();

        expect(CaboutA.code.equals(contractA.init!.code!)).toBeTruthy();
        expect(CaboutA.data.equals(contractA.init!.data!)).toBeTruthy();

        const CaboutB = await contractC.getGetNestedNext();

        expect(CaboutB.code.equals(contractB.init!.code!)).toBeTruthy();
        expect(CaboutB.data.equals(contractB.init!.data!)).toBeTruthy();

    });
});