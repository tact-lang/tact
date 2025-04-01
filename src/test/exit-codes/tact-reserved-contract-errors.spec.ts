import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { ReservedContractErrorsTester as TestContract } from "@/test/exit-codes/contracts/output/tact-reserved-contract-errors_ReservedContractErrorsTester";
import "@ton/test-utils";

type ExitCodeValue = 128 | 130 | 132 | 133 | 134 | 136 | 138;
type ExitCodeKey =
    | "TactExitCodeNullReferenceException"
    | "TactExitCodeInvalidIncomingMessage"
    | "TactExitCodeAccessDenied"
    | "TactExitCodeContractStopped"
    | "TactExitCodeInvalidArgument"
    | "TactExitCodeInvalidStandardAddress"
    | "TactExitCodeNotBasechainAddress";

const TactExitCodes: Map<ExitCodeKey, ExitCodeValue> = new Map([
    ["TactExitCodeNullReferenceException", 128],
    ["TactExitCodeInvalidIncomingMessage", 130],
    ["TactExitCodeAccessDenied", 132],
    ["TactExitCodeContractStopped", 133],
    ["TactExitCodeInvalidArgument", 134],
    ["TactExitCodeInvalidStandardAddress", 136],
    ["TactExitCodeNotBasechainAddress", 138],
]);

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
    it("should test exit code TactExitCodeNullReferenceException(128)", async () => {
        await testReservedExitCode(
            "TactExitCodeNullReferenceException",
            contract,
            treasure,
        );
    });

    // 129: Invalid serialization prefix
    // NOTE: Reserved, but due to a number of prior checks it cannot be thrown unless one hijacks
    //       the contract code before deployment and changes the opcodes of the Messages expected
    //       to be received in the contract

    // 130: Invalid incoming message
    it("should test exit code TactExitCodeInvalidIncomingMessage(130)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidIncomingMessage",
            contract,
            treasure,
        );
    });

    // 131: Constraints error
    // NOTE: Reserved, but never thrown anywhere, can't repro

    // 132: Access denied
    it("should test exit code TactExitCodeAccessDenied(132)", async () => {
        await testReservedExitCode(
            "TactExitCodeAccessDenied",
            contract,
            treasure,
        );
    });

    // 133: Contract stopped
    it("should test exit code TactExitCodeContractStopped(133)", async () => {
        await testReservedExitCode(
            "TactExitCodeContractStopped",
            contract,
            treasure,
        );
    });

    // 134: Invalid argument
    it("should test exit code TactExitCodeInvalidArgument(134)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidArgument",
            contract,
            treasure,
        );
    });

    // 135: Code of a contract was not found
    // NOTE: Reserved, but one has to replace the contract code to trigger it

    // 136: Invalid address
    it("should test exit code TactExitCodeInvalidStandardAddress(136)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidStandardAddress",
            contract,
            treasure,
        );
    });

    // 138: Not a basechain address
    it("should test exit code TactExitCodeNotBasechainAddress(138)", async () => {
        await testReservedExitCode(
            "TactExitCodeNotBasechainAddress",
            contract,
            treasure,
        );
    });
});

async function testReservedExitCode(
    codeName: ExitCodeKey,
    contract: SandboxContract<TestContract>,
    treasure: SandboxContract<TreasuryContract>,
) {
    const code = TactExitCodes.get(codeName);
    if (!code) {
        throw new Error(`No exit code found for ${codeName}`);
    }

    const sendResult = await contract.send(
        treasure.getSender(),
        { value: toNano("10") },
        codeName,
    );

    expect(sendResult.transactions).toHaveTransaction({
        from:
            codeName === "TactExitCodeInvalidIncomingMessage"
                ? contract.address
                : treasure.address,
        to: contract.address,
        success: false,
        exitCode: code,
    });
}
