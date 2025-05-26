import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { ComparisonsTester } from "./output/comparisons_ComparisonsTester";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const deployValue = toNano("1");

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const treasury = await blockchain.treasury("treasury");
    const contract = blockchain.openContract(
        await ComparisonsTester.fromInit(),
    );

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

describe("comparisons", () => {
    const state = cached(setup);

    it("should perform comparisons with mutation correctly", async () => {
        const { contract } = await state.get();

        expect(await contract.getCompare1(10n)).toBe(true);
        expect(await contract.getCompare2()).toBe(true);
        expect(await contract.getCompare3()).toBe(true);
        expect(await contract.getCompare4(10n)).toBe(true);
        expect(await contract.getCompare5()).toBe(true);
        expect(await contract.getCompare6()).toBe(true);
    });
});
