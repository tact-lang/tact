import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { MultisigContract } from "./output/multisig-3_MultisigContract";

describe("multisig-3", () => {
    it("should deploy", async () => {
        // Init contract
        const key1 = 1n;
        const key2 = 1n;
        const key3 = 1n;
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(
            await MultisigContract.fromInit(key1, key2, key3),
        );
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano("10") }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();

        // Check keys
        expect(await contract.getKey1()).toBe(key1);
        expect(await contract.getKey2()).toBe(key2);
        expect(await contract.getKey3()).toBe(key3);
    });
});
