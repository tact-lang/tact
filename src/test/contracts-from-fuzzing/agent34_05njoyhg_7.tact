fun main() : Int {
    let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    // Valid workchain check: should succeed
    forceWorkchain(addr, 0, 593);
    
    // Now, invoking forceWorkchain with incorrect workchain (-1) should throw with error code 593
    try {
        forceWorkchain(addr, -1, 593);
        return 0; // not reached
    } catch (exitCode) {
        return (exitCode == 593) ? 1 : 2;
    }
}
