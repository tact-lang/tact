import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { Test, Test_getterMapping } from "./contracts/output/getters_Test";

describe("getter-names-conflict", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement getters correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await Test.fromInit());
        await contract.send(
            treasure,
            { value: toNano("10") },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );
        await system.run();
        expect(contract).toMatchSnapshot();

        // Getter name conflicts
        expect(await contract.getTestGetter()).toBe(1n);
        expect(await contract.gettest_getter()).toBe(2n);
        expect(await contract.getTest_getter()).toBe(3n);

        expect(Test_getterMapping["testGetter"]).toBe("getTestGetter");
        expect(Test_getterMapping["test_getter"]).toBe("gettest_getter");
        expect(Test_getterMapping["Test_getter"]).toBe("getTest_getter");

        // Returning `self` from getter
        expect(await contract.getContractData()).toMatchSnapshot();

        // Passing `S` struct to getter
        expect(
            await contract.getStructAsInput({
                $$type: "S",
                a: 1n,
                b: 2n,
            }),
        ).toMatchSnapshot();

        // Passing `Test` contract data to getter
        expect(await contract.getContractAsInput()).toMatchSnapshot();
    });
});
