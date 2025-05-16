fun testForceWorkchain() {
    let basechainAddress = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc66);
    // Should not throw: chain id is 0
    forceWorkchain(basechainAddress, 0, 593);
    let masterchainAddress = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc66);
    // Should not throw: chain id is -1
    forceWorkchain(masterchainAddress, -1, 593);
    
    try {
        // This should throw: basechainAddress does not belong to workchain -1
        forceWorkchain(basechainAddress, -1, 593);
    } catch (exitCode) {
        require(exitCode == 593, "Expected exit code 593 for forceWorkchain mismatch");
    }
}

fun main() {
    testForceWorkchain();
}
