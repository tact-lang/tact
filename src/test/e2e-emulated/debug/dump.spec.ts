import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Tester } from "./output/dump_Tester";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";
import { setStoragePrices } from "@/test/utils/gasUtils";

const deployValue = toNano("1"); // `dump` is expensive

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const config = blockchain.config;

    blockchain.setConfig(
        setStoragePrices(config, {
            unixTimeSince: 0,
            bitPricePerSecond: 0n,
            cellPricePerSecond: 0n,
            masterChainBitPricePerSecond: 0n,
            masterChainCellPricePerSecond: 0n,
        }),
    );

    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await Tester.fromInit());

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

describe("dump", () => {
    const state = cached(setup);

    it("should dump values correctly in a receiver", async () => {
        const { contract, treasury } = await state.get();
        const result = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            "Dump",
        );

        expect(result.transactions[1]?.debugLogs).toMatchSnapshot();
    });
});
