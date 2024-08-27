import { beginCell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { A } from "./contracts/output/deep_A";
import { B } from "./contracts/output/deep_B";
import { C } from "./contracts/output/deep_C";
import "@ton/test-utils";

describe("random", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contractA: SandboxContract<A>;
    let contractB: SandboxContract<B>;
    let contractC: SandboxContract<C>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contractA = blockchain.openContract(await A.fromInit());
        contractB = blockchain.openContract(
            await B.fromInit(contractA.address),
        );
        contractC = blockchain.openContract(
            await C.fromInit(contractB.address),
        );
    });

    it("should chain deep sequences correctly", async () => {
        // Send a message to contract A
        const result = await contractA.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Message",
        );

        // Verify the transaction for contract A
        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contractA.address,
            success: true,
            // Add any other specific transaction properties you want to check here
        });

        // Verify the chaining by checking the "next" contracts in sequence
        const nextA = await contractA.getGetNext();
        expect(nextA.code.equals(contractB.init!.code!)).toBe(true);
        expect(nextA.data.equals(contractB.init!.data!)).toBe(true);

        const nextB = await contractB.getGetNext();
        expect(nextB.code.equals(contractC.init!.code!)).toBe(true);
        expect(nextB.data.equals(contractC.init!.data!)).toBe(true);

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contractA.address,
            success: true,
            body: beginCell()
                .storeUint(0, 32)
                .storeStringTail("Message")
                .endCell(),
        });

        expect(result.transactions).toHaveTransaction({
            from: contractA.address,
            to: contractB.address,
            success: true,
            body: beginCell()
                .storeUint(0, 32)
                .storeStringTail("Message")
                .endCell(),
        });

        expect(result.transactions).toHaveTransaction({
            from: contractB.address,
            to: contractC.address,
            success: true,
            body: beginCell()
                .storeUint(0, 32)
                .storeStringTail("Message")
                .endCell(),
        });

        expect(result.transactions).toHaveTransaction({
            from: contractC.address,
            to: contractC.address,
            success: true,
            body: beginCell()
                .storeUint(0, 32)
                .storeStringTail("Message2")
                .endCell(),
        });
    });
});
