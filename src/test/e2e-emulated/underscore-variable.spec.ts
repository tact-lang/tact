import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { UnderscoreVariableTestContract } from "./contracts/output/underscore-variable_UnderscoreVariableTestContract";

describe("underscore-variable", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement underscore variables correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(
            await UnderscoreVariableTestContract.fromInit(),
        );
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Check methods
        expect(await contract.getTest1()).toEqual(0n);
        expect(await contract.getTest2()).toEqual(12n);
        expect(await contract.getTest3()).toEqual(6n);
        expect(await contract.getTest4()).toEqual(4n);
    });
});
