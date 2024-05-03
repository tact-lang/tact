import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { MapTraverseTestContract } from "./features/output/map-traverse_MapTraverseTestContract";

describe("feature-strings", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement map traverse correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await MapTraverseTestContract.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Check methods
        expect(await contract.getTestIntInt()).toEqual(1010n);
        expect(await contract.getTestIntBool()).toEqual(12n);
        expect(await contract.getTestIntCell()).toEqual(1010n);
        expect(await contract.getTestIntAddress()).toEqual(28n);
        expect(await contract.getTestIntStruct()).toEqual(1010n);

        expect(await contract.getTestAddressInt()).toEqual(1018n);
        expect(await contract.getTestAddressBool()).toEqual(20n);
        expect(await contract.getTestAddressCell()).toEqual(1018n);
        expect(await contract.getTestAddressAddress()).toEqual(26n);
        expect(await contract.getTestAddressStruct()).toEqual(1018n);

        expect(await contract.getTestEmptyMap()).toEqual(0n);
        expect(await contract.getTestNull()).toEqual(0n);
    });
});
