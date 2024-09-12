import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { ReservedContractErrorsTester as TestContract } from "./contracts/output/tact-reserved-contract-errors_ReservedContractErrorsTester";
import "@ton/test-utils";

describe("Tact-reserved contract errors", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure", {
            resetBalanceIfZero: true,
        });

        contract = blockchain.openContract(await TestContract.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    // 128: Null reference exception
    it("should test exit code 128", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "128",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 128,
        });
    });

    // 129: Invalid serialization prefix
    // NOTE: Reserved, but due to a number of prior checks it cannot be thrown unless one hijacks
    //       the contract code before deployment and changes the opcodes of the Messages expected
    //       to be received in the contract

    // 130: Invalid incoming message
    it("should test exit code 130", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "130",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: contract.address, // From contract back to contract
            to: contract.address,
            success: false,
            exitCode: 130,
        });
    });

    // 131: Constraints error
    // NOTE: Reserved, but never thrown anywhere, can't repro

    // 132: Access denied
    it("should test exit code 132", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "132",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 132,
        });
    });

    // 133: Contract stopped
    // NOTE: Reserved, but never thrown anywhere, can't repro

    // 134: Invalid argument
    it("should test exit code 134", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "134",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 134,
        });
    });

    // 135: Code of a contract was not found
    // NOTE: Reserved, but one has to replace the contract code to trigger it

    // 136: Invalid address
    it("should test exit code 136", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "136",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 136,
        });
    });

    // 137: Masterchain support is not enabled for this contract
    it("should test exit code 137", async () => {
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "137",
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 137,
        });
    });
});
