import { Address, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Debug } from "./contracts/output/debug_Debug";
import { posixNormalize } from "../../utils/filePath";
import "@ton/test-utils";

describe("debug", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Debug>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Debug.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should dump values correctly", async () => {
        // Send Debug message
        const result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Debug",
        );

        const debugLogs =
            result.transactions[1]?.debugLogs.replace(/#DEBUG#: /g, "") ?? "";

        const filePath = posixNormalize(
            "src/test/e2e-emulated/contracts/debug.tact",
        );

        expect(debugLogs).toStrictEqual(`File ${filePath}:10:9:
dumpStack()
stack(2 values) : 10000000000 () 
File ${filePath}:11:9:
dump("Hello world!")
Hello world!
File ${filePath}:12:9:
dump(123)
123
File ${filePath}:13:9:
dump(true)
true
File ${filePath}:14:9:
dump(false)
false
File ${filePath}:15:9:
dump(null)
null
File ${filePath}:16:9:
dump(myAddress())
${contract.address.toString({ bounceable: true })}
File ${filePath}:17:9:
dump(newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8))
${Address.parseRaw(
    "0:83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8",
).toString()}
File ${filePath}:18:9:
dump(myBalance())
10000000000`);
    });
});
