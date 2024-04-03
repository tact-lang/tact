import { Address, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { Debug } from "./features/output/debug_Debug";

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
        expect(debugLogs).toStrictEqual(`stack(2 values) : 10000000000 () 
Hello world!
123
true
false
null
${contract.address.toString({ bounceable: true })}
${Address.parseRaw(
    "0:83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8",
)}`);
    });
});
