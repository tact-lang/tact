import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { RecursionTester } from "./features/output/recursion_RecursionTester";

describe("feature-recursion", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should perform recursive operations correctly", async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await RecursionTester.fromInit());
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();

        expect(await contract.getFib(0n)).toBe(0n);
        expect(await contract.getFib(1n)).toBe(1n);
        expect(await contract.getFib(2n)).toBe(1n);
        expect(await contract.getFib(3n)).toBe(2n);

        expect(await contract.getFact(0n)).toBe(1n);
        expect(await contract.getFact(1n)).toBe(1n);
        expect(await contract.getFact(2n)).toBe(2n);
        expect(await contract.getFact(3n)).toBe(6n);
    });
});
