fun testForceWorkchainMismatch() {
    let basechainAddr: Address = newAddress(0, 0x123);
    try {
        // Intentionally pass wrong workchain parameter (-1) to forceWorkchain
        forceWorkchain(basechainAddr, -1, 593);
    } catch (exitCode) {
        dump(exitCode);
    }
}
