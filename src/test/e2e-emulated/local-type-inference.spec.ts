import { Dictionary, beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { LocalTypeInferenceTester } from "./contracts/output/local-type-inference_LocalTypeInferenceTester";

describe("local-type-inference", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should automatically set types for let statements", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await LocalTypeInferenceTester.fromInit());
        await contract.send(
            treasure,
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();

        expect(contract.abi).toMatchSnapshot();
        expect(await contract.getTest1()).toStrictEqual(1n);
        expect(await contract.getTest2()).toStrictEqual(2n);
        expect((await contract.getTest3()).toRawString()).toBe(
            contract.address.toRawString(),
        );
        expect((await contract.getTest4()).toRawString()).toBe(
            contract.address.toRawString(),
        );
        expect(await contract.getTest5()).toStrictEqual(true);
        expect((await contract.getTest6()).toString()).toStrictEqual(
            beginCell().storeUint(123, 64).endCell().asSlice().toString(),
        );
        expect((await contract.getTest7()).toString()).toStrictEqual(
            beginCell().storeUint(123, 64).endCell().toString(),
        );
        expect((await contract.getTest8()).toString()).toStrictEqual(
            beginCell().storeUint(123, 64).endCell().toString(),
        );
        expect(await contract.getTest9()).toStrictEqual("hello");
        expect(await contract.getTest10()).toStrictEqual("hello");
        const test11 = await contract.getTest11();
        expect(test11.code.toString()).toStrictEqual(
            contract.init?.code.toString(),
        );
        expect(test11.data.toString()).toStrictEqual(
            contract.init?.data.toString(),
        );
        // test12 tested by abi
        // test13 tested by abi
        expect(await contract.getTest14()).toStrictEqual({
            $$type: "MyStruct",
            x: 1n,
            y: 2n,
        });
        expect(await contract.getTest15()).toStrictEqual({
            $$type: "MyStruct",
            x: 1n,
            y: 2n,
        });
        expect(await contract.getTest16()).toBeNull();
        expect(await contract.getTest17()).toBeNull();
        expect(await contract.getTest18()).toBe(2n);
    });
});
