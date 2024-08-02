import { Dictionary, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { MapComparisonTestContract } from "./contracts/output/map-comparison_MapComparisonTestContract";

describe("map-comparison", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement map comparison correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(
            await MapComparisonTestContract.fromInit(),
        );
        const tracker = system.track(contract.address);

        // Test
        {
            const m1: Dictionary<bigint, bigint> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.BigInt(256),
            );
            m1.set(1n, 2n);
            m1.set(3n, 4n);
            const m2: Dictionary<bigint, bigint> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.BigInt(256),
            );
            m2.set(1n, 2n);
            m2.set(3n, 4n);
            await contract.send(
                treasure,
                { value: toNano("10") },
                {
                    $$type: "CompareIntInt",
                    m1,
                    m2,
                },
            );
            await system.run();
            expect(tracker.collect()).toMatchSnapshot();
        }
    });
});
