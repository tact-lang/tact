import { beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { SampleJetton } from "./bugs/output/bugs_SampleJetton";
import { JettonDefaultWallet } from "./bugs/output/bugs_JettonDefaultWallet";
import { Issue211 } from "./bugs/output/bugs_Issue211";

describe("bugs", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should deploy sample jetton correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(
            await SampleJetton.fromInit(
                treasure.address,
                beginCell().endCell(),
                toNano("100"),
            ),
        );
        const target = system.open(
            await JettonDefaultWallet.fromInit(
                contract.address,
                treasure.address,
            ),
        );
        const tracker = system.track(target.address);
        await contract.send(
            treasure,
            { value: toNano("10") },
            {
                $$type: "Mint",
                receiver: treasure.address,
                amount: toNano("10"),
            },
        );
        await system.run();

        expect(contract.abi.errors!["31733"].message).toStrictEqual(
            "condition can`t be...",
        );

        expect(tracker.collect()).toMatchSnapshot();
    });
    it("should deploy issue211 correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await Issue211.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        expect(tracker.collect()).toMatchSnapshot();

        expect(await contract.getTest1()).toBe(0n);
        expect(await contract.getTest2()).toBe(0n);
        expect(await contract.getTest3()).toBe(6n);
        expect(await contract.getTest4()).toBe(24n);
        expect(await contract.getTest5()).toBe(97n);
        expect(await contract.getTest7()).toBe(42n);
        expect(await contract.getTest8()).toBe(5n);
        expect(await contract.getTest9()).toBe(5n);
    });
});
