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

        // Structs

        expect(await contract.getStructAssign1()).toEqual(true);
        expect(await contract.getStructAssign2()).toEqual(true);
        expect(await contract.getParamStruct1()).toEqual(true);
        expect(await contract.getParamStruct2()).toEqual(true);
        expect(await contract.getMutateParamStruct1()).toEqual(true);
        expect(await contract.getMutateParamStruct2()).toEqual(true);
        expect(await contract.getTestReturnedStructs()).toEqual(true);
        expect(await contract.getMutatesChainStruct1()).toEqual(true);
        expect(await contract.getMutatesChainStruct2()).toEqual(true);
        expect(await contract.getMutatesChainStruct3()).toEqual(true);
        expect(await contract.getMutatesChainStruct4()).toEqual(true);
        expect(await contract.getMutatesChainStruct5()).toEqual(true);
        expect(await contract.getMutatesChainStruct6()).toEqual(true);

        // Maps

        expect(await contract.getMapAssign1()).toEqual(true);
        expect(await contract.getMapAssign2()).toEqual(true);
        expect(await contract.getParamMap1()).toEqual(true);
        expect(await contract.getParamMap2()).toEqual(true);
        expect(await contract.getMutateParamMap1()).toEqual(true);
        expect(await contract.getMutateParamMap2()).toEqual(true);
        expect(await contract.getTestReturnedMaps1()).toEqual(true);
        // expect(await contract.getTestReturnedMaps2()).toEqual(true);
        expect(await contract.getMutateNestedMap1()).toEqual(true);

        // Integers

        expect(await contract.getMutatesChainInt1()).toEqual(true);
        expect(await contract.getMutatesChainInt2()).toEqual(true);
        expect(await contract.getMutatesChainInt3()).toEqual(true);
        expect(await contract.getMutatesChainInt4()).toEqual(true);
        expect(await contract.getMutatesChainInt5()).toEqual(true);
        expect(await contract.getMutatesChainInt6()).toEqual(true);

        // Boolean expressions

        expect(await contract.getAndMutateShortCircuit()).toEqual(true);
        expect(await contract.getAndInfiniteLoopShortCircuit()).toEqual(true);
        expect(await contract.getAndExceptionShortCircuit()).toEqual(true);
        expect(await contract.getOrMutateShortCircuit()).toEqual(true);
        expect(await contract.getOrInfiniteLoopShortCircuit()).toEqual(true);
        expect(await contract.getOrExceptionShortCircuit()).toEqual(true);
        expect(await contract.getTernaryMutateShortCircuit()).toEqual(true);
        expect(await contract.getTernaryInfiniteLoopShortCircuit()).toEqual(
            true,
        );
        expect(await contract.getTernaryExceptionShortCircuit()).toEqual(true);

        // Contracts

        expect(await contract.getContractAssign1()).toEqual(true);
        expect(await contract.getContractAssign2()).toEqual(true);
        expect(await contract.getParamContract()).toEqual(true);
        expect(await contract.getMutateParamContract()).toEqual(true);
        expect(await contract.getTestReturnedContracts()).toEqual(true);

        // Obtain the address before the contract gets modified
        const address1 = await contract.getAddress();

        // Send the message to mutate the contract
        const mutateResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "mutate",
        );
        expect(mutateResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        // The contract was successfully mutated
        expect(await contract.getMutateContractStateFlag()).toEqual(true);
        // And the changes persisted
        expect(await contract.getChangesPersisted()).toEqual(true);

        // Obtain the address after the contract was modified
        const address2 = await contract.getAddress();

        // The address before mutation and after mutation is the same.
        expect(address1.equals(address2)).toEqual(true);

        // Testing equality on addresses
        expect(await contract.getTestAddressEquality()).toEqual(true);
        expect(
            await contract.getTestInversesParseStdAddressAndNewAddress(),
        ).toEqual(true);

        // Testing equality on slices
        expect(await contract.getTestSliceEquality1()).toEqual(true);
        expect(await contract.getTestSliceEquality2()).toEqual(true);

        // Testing equality on cells
        expect(await contract.getTestCellEquality1()).toEqual(true);
        expect(await contract.getTestCellEquality2()).toEqual(true);
        expect(await contract.getTestCellEquality3()).toEqual(true);
    });
});
