import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { StructsTester } from "./contracts/output/structs_StructsTester";

describe("strings", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement structs correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await StructsTester.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        expect(await contract.getStructInitializerTest()).toEqual(true);
    });
});
