import { Address, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { Debug } from "./contracts/output/debug_Debug";
import { posixNormalize } from '../../utils/filePath'

describe("debug", () => {
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

        const filePath = posixNormalize(
            "src/test/e2e-emulated/contracts/debug.tact",
        );

        expect(debugLogs).toStrictEqual(`File ${filePath}:10:9
stack(2 values) : 10000000000 () 
File ${filePath}:11:9
Hello world!
File ${filePath}:12:9
123
File ${filePath}:13:9
true
File ${filePath}:14:9
false
File ${filePath}:15:9
null
File ${filePath}:16:9
${contract.address.toString({ bounceable: true })}
File ${filePath}:17:9
${Address.parseRaw(
    "0:83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8",
)}`);
    });
});
