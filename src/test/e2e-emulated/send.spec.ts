import { toNano, beginCell, Cell } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { SendTester } from "./contracts/output/send_SendTester";
import "@ton/test-utils";

describe("send", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SendTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
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

    it("should send with intermediate reservations", async () => {
        // emit, nativeReserve, send
        let balanceBefore = await contract.getBalance();
        await expectMessageFromTo(
            treasure,
            contract,
            textMsg("ReserveAtMost_1"),
        );
        let balanceAfter = await contract.getBalance();
        // The difference is exactly 0.05 that were reserved on top of the balance
        expect(abs(balanceBefore - balanceAfter) <= 50000000n).toBe(true);

        // send, nativeReserve, send
        balanceBefore = await contract.getBalance();
        await expectMessageFromTo(
            treasure,
            contract,
            textMsg("ReserveAtMost_2"),
        );
        balanceAfter = await contract.getBalance();
        // The difference is exactly in 0.05 that were reserved on top of the balance
        expect(abs(balanceBefore - balanceAfter) <= 50000000n).toBe(true);
    });
});

/**
 * A helper function to send a message `body` from the `treasury` to the `contract`
 * with specified `value` and `bounce` values, and then expect that transaction
 * to be successful or not (`success`), and if not — expect a certain exit code from it
 */
async function expectMessageFromTo(
    treasure: SandboxContract<TreasuryContract>,
    contract: SandboxContract<SendTester>,
    body: Cell | null = null,
    value: bigint = toNano("10"),
    bounce: boolean = false,
    success: boolean = true,
    exitCode: number = 0,
) {
    const sendResult = await treasure.send({
        to: contract.address,
        value,
        bounce,
        body,
    });
    expect(sendResult.transactions).toHaveTransaction({
        from: treasure.address,
        to: contract.address,
        success,
        exitCode,
    });
}

/** Creates a Cell message body from the passed `src` string */
function textMsg(src: string): Cell {
    return beginCell().storeUint(0, 32).storeStringTail(src).endCell();
}

/** Math.abs, but for bigint */
function abs(n: bigint) {
    return n < 0n ? -n : n;
}
