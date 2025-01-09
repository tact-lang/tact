import "@stdlib/ownable";
import "@stdlib/dns";

message(1478) SpanishInquisition {}

contract ReservedContractErrorsTester with Ownable {
    /// To make Ownable work
    owner: Address;

    /// Setups address of this contract to be its owner
    init() { self.owner = myAddress() }

    /// To handle deployment
    receive() {}

    /// Exit code 128
    receive("128") {
        let gotcha: String? = null;
        dump(gotcha!!);
    }

    /// Exit code 130
    receive("130") {
        send(SendParameters{
            to: myAddress(), // Send a message back to this contract
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: SpanishInquisition{}.toCell(), // Nobody expects it!
        });
    }

    /// Exit code 132
    receive("132") {
        self.requireOwner();
    }

    /// Exit code 134
    receive("134") {
        // Setup
        let targetCode = 134;
        let failed = true;

        // Case 1
        try {
            // 0 is code of NUL in ASCII and it is not valid Base64
            dump(beginCell()
                .storeUint(0, 8)
                .asSlice()
                .fromBase64());
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.fromBase64() didn't error on invalid Base64");

        // Case 2
        try {
            // 0 is code of NUL in ASCII and it is not valid Base64
            dump("\x00".fromBase64());
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed, "String.fromBase64() didn't error on invalid Base64");

        // Case 3
        try {
            dump((42).toFloatString(-1));
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Int.toFloatString() didn't error on digits -1");

        // Case 4
        try {
            dump((42).toFloatString(78));
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Int.toFloatString() didn't error on digits 78");

        // Case 5
        try {
            // Refs in the passed Slice are prohibited
            let sliceWithRef = beginCell().storeRef(emptyCell()).asSlice();
            dump(dnsInternalNormalize(sliceWithRef));
            failed = false;
        } catch (exitCode) {
            nativeThrowIf(exitCode, exitCode != targetCode);
        }
        require(failed, "dnsInternalNormalize() didn't error on Slice with refs");

        // As we got here, everything above caused the target exit code,
        // so let's throw it explicitly now for the tests on Blueprint's side
        throw(targetCode);
    }
}
