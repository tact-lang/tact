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

        const filePath = path.normalize("src/test/features/debug.tact");

        expect(debugLogs).toStrictEqual(`[DEBUG] File ${filePath}:10:9
stack(2 values) : 10000000000 () 
[DEBUG] File ${filePath}:11:9
Hello world!
[DEBUG] File ${filePath}:12:9
123
[DEBUG] File ${filePath}:13:9
true
[DEBUG] File ${filePath}:14:9
false
[DEBUG] File ${filePath}:15:9
null
[DEBUG] File ${filePath}:16:9
${contract.address.toString({ bounceable: true })}
[DEBUG] File ${filePath}:17:9
${Address.parseRaw(
    "0:83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8",
)}`);
    });
});
