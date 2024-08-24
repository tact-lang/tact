import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { LaikaContract } from "./contracts/output/traits_LaikaContract";

describe("traits", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement traits correctly", async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await LaikaContract.fromInit());
        await contract.send(treasure, { value: toNano("0.5") }, null);
        await system.run();
        expect(contract).toMatchSnapshot();

        // Getter name conflicts
        expect(await contract.getSay()).toBe("I am a Laika and I say Woof");
    });
});
