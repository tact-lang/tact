import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { Tester } from "./contracts/output/mutating-method-chaining_Tester";

describe("bugs", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement mutating method chaining correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await Tester.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        expect(tracker.collect()).toMatchSnapshot();

        expect(await contract.getTest1()).toBe(0n);
        expect(await contract.getTest2()).toBe(0n);
        expect(await contract.getTest3()).toBe(6n);
        expect(await contract.getTest4()).toBe(24n);
        expect(await contract.getTest5()).toBe(97n);
        expect(await contract.getTest7()).toBe(42n);
        expect(await contract.getTest8()).toBe(5n);
        expect(await contract.getTest9()).toBe(5n);
    });
});
