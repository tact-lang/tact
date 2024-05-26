import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { MyContract } from "./features/output/implicit-init_MyContract";

describe("feature-implicit-init", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    it("should deploy", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await MyContract.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(
            treasure,
            { value: toNano("1") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();
        expect(await contract.getGetCounter()).toBe(0n);
        expect(tracker.collect()).toMatchSnapshot();
    });

    it("should increment counter", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await MyContract.fromInit());
        await contract.send(
            treasure,
            { value: toNano("1") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();

        // Test
        expect(await contract.getGetCounter()).toBe(0n);
        const tracker = system.track(contract);
        await contract.send(treasure, { value: toNano("1") }, "increment");
        await system.run();
        expect(await contract.getGetCounter()).toBe(1n);
        await contract.send(treasure, { value: toNano("1") }, "increment");
        await system.run();
        expect(await contract.getGetCounter()).toBe(2n);
        expect(tracker.collect()).toMatchSnapshot();
    });
});
