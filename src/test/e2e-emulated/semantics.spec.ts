import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { SemanticsTester } from "./contracts/output/semantics_SemanticsTester";
import "@ton/test-utils";

describe("semantics", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SemanticsTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await SemanticsTester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement semantics correctly", async () => {
        // Check methods
        expect(await contract.getCheckAllContractFieldsAreUnchanged()).toEqual(
            true,
        );
        expect(await contract.getStructAssign1()).toEqual(true);
        expect(await contract.getStructAssign2()).toEqual(true);
        expect(await contract.getParamStruct1()).toEqual(true);
        expect(await contract.getParamStruct2()).toEqual(true);
        expect(await contract.getMutateParamStruct1()).toEqual(true);
        expect(await contract.getMutateParamStruct2()).toEqual(true);
        expect(await contract.getMapAssign1()).toEqual(true);
        expect(await contract.getMapAssign2()).toEqual(true);
        expect(await contract.getParamMap1()).toEqual(true);
        expect(await contract.getParamMap2()).toEqual(true);
    });
});
