import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { PrecendenceTester } from "./features/output/precendence_PrecendenceTester";

describe("feature-precendence", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement precendence of operations correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await PrecendenceTester.fromInit());
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();

        // Check methods
        expect(await contract.getTest1()).toEqual(12n);
        expect(await contract.getTest2()).toEqual(4n);
        expect(await contract.getTest3()).toEqual(12n);
        expect(await contract.getTest4()).toEqual(12n);
    });
});
