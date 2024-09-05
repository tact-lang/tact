import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { IntegerLiteralsTester } from "./contracts/output/integer-literals_IntegerLiteralsTester";
import "@ton/test-utils";

describe("integer-literals", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<IntegerLiteralsTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await IntegerLiteralsTester.fromInit(),
        );

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

    it("should implement integer literals correctly", async () => {
        // Check decimal literals
        expect(await contract.getDecLiteral1()).toEqual(123n);
        expect(await contract.getDecLiteral2()).toEqual(-123n);
        expect(await contract.getDecLiteral3()).toEqual(1012300000n);

        // Check hexadecimal literals
        expect(await contract.getHexLiteral1()).toEqual(0x123n);
        expect(await contract.getHexLiteral2()).toEqual(-0x123n);
        expect(await contract.getHexLiteral3()).toEqual(0x1012300000n);

        // Check binary literals
        expect(await contract.getBinLiteral1()).toEqual(0b101010n);
        expect(await contract.getBinLiteral2()).toEqual(-0b101010n);
        expect(await contract.getBinLiteral3()).toEqual(0b1010100000n);

        // Check octal literals
        expect(await contract.getOctLiteral1()).toEqual(0o123n);
        expect(await contract.getOctLiteral2()).toEqual(-0o123n);
        expect(await contract.getOctLiteral3()).toEqual(0o1012300000n);
    });
});
