import { toNano, beginCell } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { SendTester } from "./contracts/output/send_SendTester";
import "@ton/test-utils";

describe("send", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SendTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await SendTester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should send reply correctly", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Hello",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            body: beginCell()
                .storeUint(0, 32)
                .storeStringTail("Hello")
                .endCell(),
        });
    });

    it("should bounce on unknown message", async () => {
        const sendResult = await treasure.send({
            to: contract.address,
            value: toNano("10"),
            body: beginCell().storeStringTail("Unknown").endCell(),
        });

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 130,
        });
    });
});
