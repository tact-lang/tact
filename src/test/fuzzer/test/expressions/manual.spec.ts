import { toNano } from "@ton/core";
import { Test } from "./resources/test.tact_Test";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";

type ContractWithContext = {
    blockchain: Blockchain;
    treasury: SandboxContract<TreasuryContract>;
    contract: SandboxContract<Test>;
};

describe("manual test", () => {
    let contractWithContext: ContractWithContext;

    beforeAll(async () => {
        // Initialize the blockchain and contracts
        const blockchain = await Blockchain.create();

        blockchain.verbosity.print = false;
        contractWithContext = {
            blockchain,
            treasury: await blockchain.treasury("treasury"),
            contract: blockchain.openContract(await Test.fromInit()),
        };

        // Fund the contract with some TONs
        contractWithContext.contract.send(
            contractWithContext.treasury.getSender(),
            { value: toNano("1") },
            null,
        );
    });

    it("", async () => {
        expect(await contractWithContext.contract.getGetInt()).toBe(1);
    });
});
