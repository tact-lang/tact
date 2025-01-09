import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import {
    ComputePhaseErrorsTester as TestContract,
    ExitCode4,
} from "./contracts/output/compute-phase-errors_ComputePhaseErrorsTester";
import "@ton/test-utils";

describe("compute phase errors", () => {
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
            { value: toNano("10000") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    // 0: success
    it("should test exit code 0", async () => {
        await testComputePhaseExitCode(0, contract, treasure);
    });

    // 1: alt. success code
    it("should test exit code 1", async () => {
        await testComputePhaseExitCode(1, contract, treasure);
    });

    // 2: stack underflow
    it("should test exit code 2", async () => {
        await testComputePhaseExitCode(2, contract, treasure);
    });

    // 3: Stack overflow
    it("should test exit code 3", async () => {
        await testComputePhaseExitCode(3, contract, treasure);
    });

    // 4: Integer overflow
    it("should test exit code 4", async () => {
        await testComputePhaseExitCode(4, contract, treasure);
    });

    // 5: Integer out of range
    it("should test exit code 5", async () => {
        await testComputePhaseExitCode(5, contract, treasure);
    });

    // 6: Invalid opcode
    it("should test exit code 6", async () => {
        await testComputePhaseExitCode(8, contract, treasure);
    });

    // 7: Type check error
    it("should test exit code 7", async () => {
        await testComputePhaseExitCode(7, contract, treasure);
    });

    // 8: Cell overflow
    it("should test exit code 8", async () => {
        await testComputePhaseExitCode(8, contract, treasure);
    });

    // 9: Cell underflow
    it("should test exit code 9", async () => {
        await testComputePhaseExitCode(9, contract, treasure);
    });

    // 10: Dictionary error
    it("should test exit code 10", async () => {
        await testComputePhaseExitCode(10, contract, treasure);
    });

    // 11: "Unknown" error
    // NOTE: Thrown in various unrelated cases
    it("should test exit code 11", async () => {
        await testComputePhaseExitCode(11, contract, treasure);
    });

    // 12: Fatal error
    // NOTE: thrown by TVM in situations deemed impossible

    // 13 (actually, -14): Out of gas
    it("should test exit code 13", async () => {
        await testComputePhaseExitCode(13, contract, treasure);
    });

    // 14: Virtualization error
    // NOTE: Reserved, but never thrown
});

async function testComputePhaseExitCode(
    code: number,
    contract: SandboxContract<TestContract>,
    treasure: SandboxContract<TreasuryContract>,
) {
    expect(code).toBeGreaterThanOrEqual(0);
    expect(code).toBeLessThan(128);
    expect([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13]).toContain(code);
    type testedExitCodes =
        | "0"
        | "1"
        | "2"
        | "3"
        | ExitCode4
        | "5"
        | "6"
        | "7"
        | "8"
        | "9"
        | "10"
        | "11"
        | "13";

    const sendResult = await contract.send(
        treasure.getSender(),
        { value: toNano("10") },
        code === 4
            ? {
                  $$type: "ExitCode4",
                  val0: BigInt(0),
                  val1: BigInt(1),
              }
            : (code.toString(10) as testedExitCodes),
    );

    expect(sendResult.transactions).toHaveTransaction({
        from: treasure.address,
        to: contract.address,
        success: code === 0 || code === 1 ? true : false,
        exitCode: code === 13 ? -14 : code,
    });
}
