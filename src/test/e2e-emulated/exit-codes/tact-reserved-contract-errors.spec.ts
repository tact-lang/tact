import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { ReservedContractErrorsTester as TestContract } from "@/test/e2e-emulated/exit-codes/output/tact-reserved-contract-errors_ReservedContractErrorsTester";
import "@ton/test-utils";

type ExitCodeValue = 128 | 129 | 130 | 132 | 133 | 134 | 136 | 138;
type ExitCodeKey =
    | "TactExitCodeNullReferenceException"
    | "TactExitCodeInvalidSerializationPrefix"
    | "TactExitCodeInvalidIncomingMessage"
    | "TactExitCodeAccessDenied"
    | "TactExitCodeContractStopped"
    | "TactExitCodeInvalidArgument"
    | "TactExitCodeInvalidStandardAddress"
    | "TactExitCodeNotBasechainAddress";

const TactExitCodes: Map<ExitCodeKey, ExitCodeValue> = new Map([
    ["TactExitCodeNullReferenceException", 128],
    ["TactExitCodeInvalidSerializationPrefix", 129],
    ["TactExitCodeInvalidIncomingMessage", 130],
    ["TactExitCodeAccessDenied", 132],
    ["TactExitCodeContractStopped", 133],
    ["TactExitCodeInvalidArgument", 134],
    ["TactExitCodeInvalidStandardAddress", 136],
    ["TactExitCodeNotBasechainAddress", 138],
]);

describe("Tact-reserved contract errors", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury", {
            resetBalanceIfZero: true,
        });

        contract = blockchain.openContract(await TestContract.fromInit());

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("100000") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
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
            treasury,
        );
    });

    // 129: Invalid serialization prefix
    it("should test exit code TactExitCodeInvalidSerializationPrefix(129)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidSerializationPrefix",
            contract,
            treasury,
        );
    });

    // 130: Invalid incoming message
    it("should test exit code TactExitCodeInvalidIncomingMessage(130)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidIncomingMessage",
            contract,
            treasury,
        );
    });

    // 131: Constraints error
    // NOTE: Reserved, but never thrown anywhere, can't repro

    // 132: Access denied
    it("should test exit code TactExitCodeAccessDenied(132)", async () => {
        await testReservedExitCode(
            "TactExitCodeAccessDenied",
            contract,
            treasury,
        );
    });

    // 133: Contract stopped
    it("should test exit code TactExitCodeContractStopped(133)", async () => {
        await testReservedExitCode(
            "TactExitCodeContractStopped",
            contract,
            treasury,
        );
    });

    // 134: Invalid argument
    it("should test exit code TactExitCodeInvalidArgument(134)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidArgument",
            contract,
            treasury,
        );
    });

    // 135: Code of a contract was not found
    // NOTE:
    // If the code of the contract is missing or does not match the one saved
    // in the TypeScript wrappers, an error with exit code 135 will be thrown

    // 136: Invalid address
    it("should test exit code TactExitCodeInvalidStandardAddress(136)", async () => {
        await testReservedExitCode(
            "TactExitCodeInvalidStandardAddress",
            contract,
            treasury,
        );
    });

    // 138: Not a basechain address
    it("should test exit code TactExitCodeNotBasechainAddress(138)", async () => {
        await testReservedExitCode(
            "TactExitCodeNotBasechainAddress",
            contract,
            treasury,
        );
    });
});

async function testReservedExitCode(
    codeName: ExitCodeKey,
    contract: SandboxContract<TestContract>,
    treasury: SandboxContract<TreasuryContract>,
) {
    const code = TactExitCodes.get(codeName);
    if (!code) {
        throw new Error(`No exit code found for ${codeName}`);
    }

    const sendResult = await contract.send(
        treasury.getSender(),
        { value: toNano("10") },
        codeName,
    );

    if (codeName === "TactExitCodeInvalidIncomingMessage") {
        expect(sendResult.transactions).toHaveTransaction({
            from: contract.address,
            to: contract.address,
            success: false,
            exitCode: code,
        });
        return;
    }

    expect(sendResult.transactions).toHaveTransaction({
        from: treasury.address,
        to: contract.address,
        success: true,
    });
}
