import { Address, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { Debug } from "./features/output/debug_Debug";
import path from "path";

describe("feature-debug", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should dump values correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await Debug.fromInit());
        const logger = system.log(contract.address);
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();

        logger.reset();
        await contract.send(treasure, { value: toNano("10") }, "Debug");
        await system.run();

        const res = logger.collect();
        const debugLogs = res.slice(
            res.indexOf("=== DEBUG LOGS ===") + 19,
            res.indexOf("=== VM LOGS ===") - 2,
        );

        expect(debugLogs)
            .toStrictEqual(`[DEBUG] File debug.tact, Line 10, Column 9
stack(2 values) : 10000000000 () 
[DEBUG] File debug.tact, Line 11, Column 9
Hello world!
[DEBUG] File debug.tact, Line 12, Column 9
123
[DEBUG] File debug.tact, Line 13, Column 9
true
[DEBUG] File debug.tact, Line 14, Column 9
false
[DEBUG] File debug.tact, Line 15, Column 9
null
[DEBUG] File debug.tact, Line 16, Column 9
${contract.address.toString({ bounceable: true })}
[DEBUG] File debug.tact, Line 17, Column 9
${Address.parseRaw(
    "0:83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8",
)}`);
    });
});
