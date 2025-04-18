import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import "@ton/test-utils";
import type {
    MsgComplex,
    MsgEmpty,
    MsgSingle,
    MsgWithRemaining,
} from "@/test/e2e-emulated/structs-and-messages/output/inMsg_Test";
import { Test } from "@/test/e2e-emulated/structs-and-messages/output/inMsg_Test";
import { cached } from "@/test/utils/cache-state";

const deployValue = toNano("1");

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await Test.fromInit());

    const deployResult = await contract.send(
        treasury.getSender(),
        { value: deployValue },
        null,
    );
    expect(deployResult.transactions).toHaveTransaction({
        from: treasury.address,
        to: contract.address,
        success: true,
        deploy: true,
    });

    return {
        blockchain,
        treasury,
        contract,
    };
};

describe("inMsg", () => {
    const state = cached(setup);

    async function checkMessage(
        contract: SandboxContract<Test>,
        treasury: SandboxContract<TreasuryContract>,
        msg: MsgEmpty | MsgSingle | MsgComplex | MsgWithRemaining,
    ) {
        const result = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            msg,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
        });
    }

    it("should have same slices", async () => {
        const { contract, treasury } = await state.get();
        await checkMessage(contract, treasury, { $$type: "MsgEmpty" });
        await checkMessage(contract, treasury, { $$type: "MsgSingle", a: 10n });
        await checkMessage(contract, treasury, {
            $$type: "MsgComplex",
            a: 10n,
            b: beginCell().storeBit(1).storeInt(999, 32).endCell(),
        });
        await checkMessage(contract, treasury, {
            $$type: "MsgWithRemaining",
            a: 10n,
            b: beginCell().storeBit(1).storeInt(999, 32).endCell(),
            s: beginCell().storeBit(0).storeInt(777, 32).asSlice(),
        });
    });
});
