import "@stdlib/ownable";
import "@stdlib/dns";
import "@stdlib/stoppable";

message(1478) SpanishInquisition {}

message(1970) SpanishInquisitionEpisode {}

contract ReservedContractErrorsTester with Ownable, Stoppable {
    /// To make Ownable work
    owner: Address;
    stopped: Bool = false;

    const masterchainAddress: Address = newAddress(-1, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873);

    /// Setups address of this contract to be its owner
    init() { self.owner = myAddress() }

    /// To handle deployment
    receive() {}

    /// Exit code TactExitCodeNullReferenceException
    receive("TactExitCodeNullReferenceException") {
        // Setup
        let targetCode = TactExitCodeNullReferenceException;
        let failed = true;

        // Case 1
        try {
            let gotcha: String? = null;
            dump(gotcha!!);

            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }

        require(failed, "Didn't error on null reference exception");
    }

    /// Exit code TactExitCodeInvalidSerializationPrefix
    receive("TactExitCodeInvalidSerializationPrefix") {
        // Setup
        let targetCode = TactExitCodeInvalidSerializationPrefix;
        let failed = true;

        // Case 1
        try {
            // An attempt to deserialize one message body from a Cell with another message body
            let tmp = SpanishInquisition.fromCell(SpanishInquisitionEpisode {}.toCell());
            dump(tmp.toCell());

            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }

        require(failed, "Didn't error on invalid serialization prefix");
    }

    /// Exit code TactExitCodeInvalidIncomingMessage
    receive("TactExitCodeInvalidIncomingMessage") {
        message(MessageParameters {
            to: myAddress(), // Send a message back to this contract
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: SpanishInquisition {}.toCell(), // Nobody expects it!
        });
    }

    /// Exit code TactExitCodeAccessDenied
    receive("TactExitCodeAccessDenied") {
        // Setup
        let targetCode = TactExitCodeAccessDenied;
        let failed = true;

        // Case 1
        try {
            self.requireOwner();

            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }

        require(failed, "self.requireOwner() didn't error on a non-owner");
    }

    /// Exit code TactExitCodeContractStopped
    receive("TactExitCodeContractStopped") {
        // Setup
        let targetCode = TactExitCodeContractStopped;
        let failed = true;

        // Case 1
        try {
            self.stopped = true;
            self.requireNotStopped();

            failed = false;
            dump(failed);
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }

        require(failed, "self.requireNotStopped() didn't error on the self.stopped = true");
    }

    /// Exit code TactExitCodeInvalidArgument
    receive("TactExitCodeInvalidArgument") {
        // Setup
        let targetCode = TactExitCodeInvalidArgument;
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
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.fromBase64() didn't error on invalid Base64");

        // Case 2
        try {
            // 0 is code of NUL in ASCII and it is not valid Base64
            dump("\x00".fromBase64());
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "String.fromBase64() didn't error on invalid Base64");

        // Case 3
        try {
            dump((42).toFloatString(-1));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Int.toFloatString() didn't error on digits -1");

        // Case 4
        try {
            dump((42).toFloatString(78));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Int.toFloatString() didn't error on digits 78");

        // Case 5
        try {
            // Refs in the passed Slice are prohibited
            let sliceWithRef = beginCell().storeRef(emptyCell()).asSlice();
            dump(dnsInternalNormalize(sliceWithRef));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "dnsInternalNormalize() didn't error on Slice with refs");
    }

    /// Exit code TactExitCodeInvalidStandardAddress
    receive("TactExitCodeInvalidStandardAddress") {
        // Setup
        let targetCode = TactExitCodeInvalidStandardAddress;
        let failed = true;

        // Case 1: Invalid tag prefix in masterchain
        try {
            let chainID = -1; // masterchain
            let addrSlice = beginCell()
                .storeUint(0b10_1, 3) // WRONG prefix!
                .storeInt(chainID, 8) // chain ID -1
                .storeUint(0, 256) // account ID 0
                .asSlice();
            dump(addrSlice.asAddress(chainID));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.asAddress() didn't error on invalid tag prefix for a masterchain address");

        // Case 2: Invalid tag prefix in basechain
        try {
            let chainID = 0; // basechain
            let addrSlice = beginCell()
                .storeUint(0b10_1, 3) // WRONG prefix!
                .storeInt(chainID, 8) // chain ID 0
                .storeUint(0, 256) // account ID 0
                .asSlice();
            dump(addrSlice.asAddress(chainID));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.asAddress() didn't error on invalid tag prefix for a basechain address");

        // Case 3: Invalid tag prefix in some workchain
        try {
            let chainID = 1; // some workchain
            let addrSlice = beginCell()
                .storeUint(0b10_1, 3) // WRONG prefix!
                .storeInt(chainID, 8) // chain ID 1
                .storeUint(0, 256) // account ID 0
                .asSlice();
            dump(addrSlice.asAddress(chainID));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.asAddress() didn't error on invalid tag prefix for a workchain address");

        // Case 4: Valid tag prefix in chain ID 0, but invalid account ID size
        try {
            let chainID = 0; // basechain
            let addrSlice = beginCell()
                .storeUint(0b10_0, 3) // correct prefix
                .storeInt(chainID, 8) // chain ID 0
                .storeUint(0, 42) // WRONG size of the account ID!
                .asSlice();
            dump(addrSlice.asAddress(chainID));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.asAddress() didn't error on invalid account ID size for a basechain address");

        // Case 5: Valid tag prefix in chain ID -1, but invalid account ID size
        try {
            let chainID = -1; // masterchain
            let addrSlice = beginCell()
                .storeUint(0b10_0, 3) // correct prefix
                .storeInt(chainID, 8) // chain ID -1
                .storeUint(0, 42) // WRONG size of the account ID!
                .asSlice();
            dump(addrSlice.asAddress(chainID));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.asAddress() didn't error on invalid account ID size for a masterchain address");

        // Case 6: Valid tag prefix in chain ID 1, but invalid account ID size
        try {
            let chainID = 1; // some workchain
            let addrSlice = beginCell()
                .storeUint(0b10_0, 3) // correct prefix
                .storeInt(chainID, 8) // chain ID 0
                .storeUint(0, 42) // WRONG size of the account ID!
                .asSlice();
            dump(addrSlice.asAddress(chainID));
            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }
        require(failed, "Slice.asAddress() didn't error on invalid account ID size for a workchain address");
    }

    receive("TactExitCodeNotBasechainAddress") {
        // Setup
        let targetCode = TactExitCodeNotBasechainAddress;
        let failed = true;

        // Case 1
        try {
            forceBasechain(self.masterchainAddress);

            failed = false;
        } catch (exitCode) {
            throwIf(exitCode, exitCode != targetCode);
        }

        require(failed, "Didn't error on not basechain address");
    }
}
