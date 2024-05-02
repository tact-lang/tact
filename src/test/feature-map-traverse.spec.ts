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
        let system = await ContractSystem.create();
        let treasure = system.treasure("treasure");
        let contract = system.open(await MapTraverseTestContract.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Check methods
        expect(await contract.getTest1()).toEqual(1000n);
    });
});
