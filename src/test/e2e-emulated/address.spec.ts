import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { AddressTester } from "./contracts/output/address_AddressTester";

describe("address", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    it("should implement addresses correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await AddressTester.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Check methods
        expect((await contract.getTest1()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
        expect((await contract.getTest2()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
        expect((await contract.getTest3()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
    });
});
