import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import {
    ConstantTester,
    INT,
    STRING,
    STRING_WITH_QUOTES,
    BOOL,
    ADDR,
    CELL,
    SLICE,
} from "./contracts/output/constants-for-wrappers_ConstantTester";
import "@ton/test-utils";

describe("constants-for-wrappers", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<ConstantTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await ConstantTester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement constants correctly", async () => {
        expect(await contract.getGlobalInt()).toEqual(INT);
        expect(await contract.getGlobalString()).toEqual(STRING);
        expect(await contract.getGlobalStringWithQuotes()).toEqual(
            STRING_WITH_QUOTES,
        );
        expect(await contract.getGlobalBool()).toEqual(BOOL);
        expect((await contract.getGlobalAddress()).toRawString()).toEqual(
            ADDR.toRawString(),
        );
        expect(
            (await contract.getGlobalCell()).toBoc().toString("base64"),
        ).toEqual(CELL.toBoc().toString("base64"));
        expect(
            (await contract.getGlobalSlice())
                .asCell()
                .toBoc()
                .toString("base64"),
        ).toEqual(SLICE.asCell().toBoc().toString("base64"));

        expect(await contract.getContractInt()).toEqual(ConstantTester.INT);
        expect(await contract.getContractString()).toEqual(
            ConstantTester.STRING,
        );
        expect(await contract.getContractStringWithQuotes()).toEqual(
            ConstantTester.STRING_WITH_QUOTES,
        );
        expect(await contract.getContractBool()).toEqual(ConstantTester.BOOL);
        expect((await contract.getContractAddress()).toRawString()).toEqual(
            ConstantTester.ADDR.toRawString(),
        );
        expect(
            (await contract.getContractCell()).toBoc().toString("base64"),
        ).toEqual(ConstantTester.CELL.toBoc().toString("base64"));
        expect(
            (await contract.getContractSlice())
                .asCell()
                .toBoc()
                .toString("base64"),
        ).toEqual(ConstantTester.SLICE.asCell().toBoc().toString("base64"));
    });
});
