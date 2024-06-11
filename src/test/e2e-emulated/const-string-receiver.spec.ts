import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { ConstStringReceiverTester } from "../e2e-emulated/contracts/output/const-string-receiver_ConstStringReceiverTester";

describe("constant string receiver", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement const string receiver correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(
            await ConstStringReceiverTester.fromInit(),
        );

        expect(contract.abi).toMatchSnapshot();

        // Deploy
        await contract.send(treasure, { value: toNano("10") }, "string 1");
        await system.run();

        const tracker = system.track(contract);

        await contract.send(treasure, { value: toNano("10") }, "string 1");
        await contract.send(treasure, { value: toNano("10") }, "string 2");
        await contract.send(treasure, { value: toNano("10") }, "string 3");
        await system.run();

        expect(tracker.collect()).toMatchSnapshot();
    });
});
