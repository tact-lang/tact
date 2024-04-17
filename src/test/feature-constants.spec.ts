import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { ConstantTester } from "./features/output/constants_ConstantTester";

describe("feature-constants", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement constants correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await ConstantTester.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Check methods
        expect(await contract.getSomething1()).toEqual(11n);
        expect(await contract.getSomething2()).toBeNull();
        expect(await contract.getSomething3()).toEqual(toNano("123"));
        expect(await contract.getSomething4()).toEqual(toNano("456"));
        expect(await contract.getSomething5()).toEqual("Hello world!");
        expect(await contract.getSomething6()).toEqual(10n);
        expect(await contract.getSomething7()).toEqual(5n);
        expect(await contract.getSomething8()).toEqual(4n);
        expect((await contract.getSomething9()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
        expect((await contract.getSomething10()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
        expect(await contract.getGlobalConst()).toEqual(100n);
    });
});
