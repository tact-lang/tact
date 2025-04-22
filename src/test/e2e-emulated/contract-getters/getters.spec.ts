import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test, Test_getterMapping } from "./output/getters_Test";
import { Test as Test2 } from "./output/empty-message-getter-parameter_Test";
import "@ton/test-utils";

// disable tests on MacOS
const it = process.platform === "darwin" && process.env.CI ? test.skip : test;

describe("getters", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;
    let contract2: SandboxContract<Test2>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");

        contract = blockchain.openContract(await Test.fromInit());
        contract2 = blockchain.openContract(await Test2.fromInit());

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        const deployResult2 = await contract2.send(
            treasury.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult2.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract2.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement getters correctly", async () => {
        // Getter name conflicts
        expect(await contract.getTestGetter()).toBe(1n);
        expect(await contract.gettest_getter()).toBe(2n);
        expect(await contract.getTest_getter()).toBe(3n);

        expect(Test_getterMapping["testGetter"]).toBe("getTestGetter");
        expect(Test_getterMapping["test_getter"]).toBe("gettest_getter");
        expect(Test_getterMapping["Test_getter"]).toBe("getTest_getter");

        // Passing `S` struct to getter
        expect(
            await contract.getStructAsInput({
                $$type: "S",
                a: 1n,
                b: 2n,
            }),
        ).toMatchSnapshot();

        // Returning `self` from getter
        expect(await contract.getContractData()).toMatchSnapshot();

        // Passing `SetIdAndData` message to getter
        expect(
            await contract.getMessageAsInput1({
                $$type: "SetIdAndData",
                id: 42n,
                data: beginCell().endCell(),
            }),
        ).toBe(42n);
        expect(
            await contract.getMessageAsInput2({
                $$type: "SetIdAndData",
                id: 42n,
                data: beginCell().endCell(),
            }),
        ).toMatchSnapshot();

        // Passing `Test` contract data to getter
        expect(
            await contract.getContractAsInput({
                $$type: "Test$Data",
                id: 123n,
                anotherData: beginCell().storeUint(123, 64).endCell(),
            }),
        ).toMatchSnapshot();

        expect(await contract.getMethodIdExpr()).toBe(true);
        expect(await contract.getMethodIdConst()).toBe(2n ** 14n);
        expect(await contract.getMethodIdMin()).toBe(true);
        expect(await contract.getMethodIdMax()).toBe(true);
    });

    it("should take empty message as parameter", async () => {
        const res = await contract2.getFoo({ $$type: "Foo" });
        expect(res).toMatchObject({});
    });
});
