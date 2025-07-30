contract TestForceWorkchainMismatch {
    // This contract tests forceWorkchain expected to throw when workchain parameter doesn't match the address chain
    receive() {
        // Create a basechain address (workchain 0)
        let addr = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let caught: Bool = false;
        try {
            // Expect error because address chain (0) does not match expected -1
            forceWorkchain(addr, -1, 593);
        } catch (exitCode) {
            caught = (exitCode == 593);
        }
        require(caught, "FW_Mismatch");
    }
}

contract TestForceWorkchainCorrect {
    // This contract tests forceWorkchain with a matching workchain parameter, expecting no error
    receive() {
        // Create a masterchain address (workchain -1)
        let addr = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        // Should not throw because the chain matches
        forceWorkchain(addr, -1, 593);
    }
}

contract TestParseStdAddress {
    // This contract tests parsing a standard address from a Slice and re-constructing it
    receive() {
        // Create a basechain address with a known hash
        let addr = newAddress(0, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
        // Convert to Slice using extension function asSlice
        let s = addr.asSlice();
        // Parse the slice back to StdAddress
        let stdAddr = parseStdAddress(s);
        // Reconstruct a new address using newAddress
        let addr2 = newAddress(stdAddr.workchain, stdAddr.address);
        require(addr == addr2, "ParseStd");
    }
}

contract TestAddressToString {
    // This contract tests the toString extension for Address
    receive() {
        let addr = newAddress(0, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
        let addrStr = addr.toString();
        // Dump the resulting string for manual inspection
        dump(addrStr);
    }
}
