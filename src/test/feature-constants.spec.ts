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
        expect(contract).toMatchSnapshot();

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
        expect(await contract.getSomething11()).toEqual(88n);
        expect(await contract.getSomething12()).toEqual(-90n);
        expect(await contract.getSomething13()).toEqual(88n);
        expect(await contract.getSomething14()).toEqual(243n);
        expect(await contract.getSomething15()).toEqual(32n);
        expect(await contract.getSomething16()).toEqual(
            -115792089237316195423570985008687907853269984665640564039457584007913129639936n,
        );
        expect(await contract.getSomething17()).toEqual(
            115792089237316195423570985008687907853269984665640564039457584007913129639935n,
        );
        expect(await contract.getSomething18()).toEqual(
            -115792089237316195423570985008687907853269984665640564039457584007913129639935n,
        );
        expect(await contract.getSomething19()).toEqual(
            -115792089237316195423570985008687907853269984665640564039457584007913129639936n,
        );
        expect(await contract.getMinInt1()).toEqual(
            -115792089237316195423570985008687907853269984665640564039457584007913129639936n,
        );
        expect(await contract.getSomething20()).toEqual(-6n);
        expect(await contract.getGlobalConst()).toEqual(100n);
    });
});
