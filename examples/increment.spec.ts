import { IncrementContract } from "./output/increment_IncrementContract";
import { ContractSystem } from "@tact-lang/emulator";
import { toNano } from "@ton/core";

describe("increment", () => {
    it("should deploy", async () => {
        // Create wallet
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await IncrementContract.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();

        // Send internal message
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Increment", key: 0n, value: -1232n },
        );
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
});
