import "@ton/test-utils";

import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Flat } from "./output/map-literals_Flat";

import { zeroStoragePrices } from "@/test/utils/gasUtils";

const deployValue = toNano("1"); // `dump` is expensive

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    blockchain.setConfig(zeroStoragePrices(blockchain.config));

    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await Flat.fromInit());

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

it("should correctly compile in functions", async () => {
    const { contract } = await setup();
    const result = await contract.getInState();
    expect(result).toMatchSnapshot();
});

it("should correctly compile empty literals", async () => {
    const { contract } = await setup();
    const result = await contract.getEmpty();
    expect(result).toMatchSnapshot();
});

it("should correctly compile const in contract", async () => {
    const { contract } = await setup();
    const result = await contract.getContractConst();
    expect(result).toMatchSnapshot();
});

it("should correctly compile global const", async () => {
    const { contract } = await setup();
    const result = await contract.getGlobalConst();
    expect(result).toMatchSnapshot();
});

it("should create maps with address keys", async () => {
    const { contract } = await setup();
    const result = await contract.getAddress();
    expect(result).toMatchSnapshot();
});

it("should work with large maps", async () => {
    const { contract } = await setup();
    const result = await contract.getLarge();
    expect(result).toMatchSnapshot();
});

it("should match explicitly constructed maps", async () => {
    const { contract } = await setup();
    const result = await contract.getEq();
    expect(result).toBeTruthy();
});

it("should work with expressions in keys and values", async () => {
    const { contract } = await setup();
    const result = await contract.getExpression();
    expect(result).toMatchSnapshot();
});

it("should keep get/set invariants of regular maps", async () => {
    const { contract } = await setup();
    const result = await contract.getGetSetResult();
    expect(result).toBeTruthy();
});

it("should work as global constant map", async () => {
    const { contract } = await setup();
    const result = await contract.getDecode();
    expect(result).toMatchSnapshot();
});

it("should work anonymously", async () => {
    const { contract } = await setup();
    const result = await contract.getAnonymous();
    expect(result).toMatchSnapshot();
});

it("the last value of the same key should be used", async () => {
    const { contract } = await setup();
    const result = await contract.getDuplicates();
    expect(result).toMatchSnapshot();
});
