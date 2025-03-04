import { toNano, beginCell } from "@ton/core";
import type { Address, Cell } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { CashbackTester } from "./contracts/output/cashback_CashbackTester";
import "@ton/test-utils";

describe("cashback", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<CashbackTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await CashbackTester.fromInit());

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

    it("should send reply", async () => {
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

    it("should send the value to the sender", async () => {
        const valForSend = toNano("10");
        const msgText = "sender";

        const valBefore = await getBalance(blockchain, treasure.address);
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: valForSend },
            msgText,
        );

        // To the contract
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            body: textMsg(msgText),
        });

        // From the contract
        expect(sendResult.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            success: true,
            inMessageBounceable: false,
            body: beginCell().endCell(),
        });

        const valAfter = await getBalance(blockchain, treasure.address);
        expect(valAfter - valBefore <= valForSend).toBe(true);
    });

    it("should send the value to itself", async () => {
        const valForSend = toNano("10");
        const msgText = "myself";

        const valBefore = await getBalance(blockchain, contract.address);
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: valForSend },
            msgText,
        );

        // To the contract
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            body: textMsg(msgText),
        });

        // From the contract
        expect(sendResult.transactions).toHaveTransaction({
            from: contract.address,
            to: contract.address,
            success: true,
            inMessageBounceable: false,
            body: beginCell().endCell(),
        });

        const valAfter = await getBalance(blockchain, contract.address);
        expect(valAfter - valBefore <= valForSend).toBe(true);
    });
});

/** Creates a Cell message body from the passed `src` string */
function textMsg(src: string): Cell {
    return beginCell().storeUint(0, 32).storeStringTail(src).endCell();
}

/** Finds the balance of the given contract `addr` on the `blockchain` */
async function getBalance(
    blockchain: Blockchain,
    addr: Address,
): Promise<bigint> {
    return (await blockchain.getContract(addr)).balance;
}
