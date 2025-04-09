contract TestForceWorkchain {
    fun test() {
        // Create a valid basechain address: chainID = 0
        let addrBase: Address = newAddress(0, 42);
        // Should not throw as addrBase is in workchain 0
        forceWorkchain(addrBase, 0, 999);
        
        // Try using forceWorkchain with an incorrect workchain (-1) expecting to throw exit code 999
        try {
            forceWorkchain(addrBase, -1, 999);
        } catch (exitCode) {
            require(exitCode == 999, "Unexpected exit code");
        }
    }
}
