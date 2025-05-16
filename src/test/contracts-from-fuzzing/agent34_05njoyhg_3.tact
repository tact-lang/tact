fun main() : Int {
    // Test: forceBasechain verification
    
    // Valid case: address with workchain 0 should not throw
    let validAddr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    forceBasechain(validAddr);

    // Invalid case: masterchain address used with forceBasechain should throw with exit code 138
    try {
        forceBasechain(newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8));
        return 0; // This point should not be reached
    } catch (exitCode) {
        return (exitCode == 138) ? 1 : 2;
    }
}
