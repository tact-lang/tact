fun validWorkchainAddress(): Address {
    // Valid workchain address: chain id 0 and valid hash
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun validMasterchainAddress(): Address {
    // Valid masterchain address: chain id -1 and valid 256-bit hash
    return newAddress(-1, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
}

// The following function is expected to trigger a compile-time error
// because only chain IDs 0 and -1 are allowed:
// fun invalidChainAddress(): Address {
//     return newAddress(1, 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
// }

contract Dummy {}

fun testContractAddressEquivalence(): Bool {
    let initPkg: StateInit = initOf Dummy();
    // contractAddress is an alias to contractAddressExt(0, s.code, s.data)
    return contractAddress(initPkg) == contractAddressExt(0, initPkg.code, initPkg.data);
}

fun testContractHash(): Int {
    let initPkg: StateInit = initOf Dummy();
    return contractHash(initPkg.code, initPkg.data);
}

fun testForceBasechainSuccess(): Bool {
    let baseAddr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    // Should succeed silently because the address is basechain
    forceBasechain(baseAddr);
    return true;
}

fun testForceBasechainFailure(): Bool {
    try {
        let masterAddr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        // This should throw with exit code 138 (Not a basechain address)
        forceBasechain(masterAddr);
        // If no exception is thrown, return false
        return false;
    } catch (exitCode) {
        return exitCode == 138;
    }
}

fun testForceWorkchain(): Bool {
    let baseAddr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let masterAddr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    // Should pass silently
    forceWorkchain(baseAddr, 0, 593);
    forceWorkchain(masterAddr, -1, 593);
    try {
        // This should throw because baseAddr's chain id (0) does not match -1
        forceWorkchain(baseAddr, -1, 593);
        return false;
    } catch (exitCode) {
        return exitCode == 593;
    }
}
