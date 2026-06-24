contract TestContract { }

// Test function for forceBasechain and address literal conversion

fun testForceBasechain() {
    // Create a basechain address (workchain 0); should pass forceBasechain
    let baseAddr = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    forceBasechain(baseAddr);

    // Create a masterchain address (workchain -1); forceBasechain should throw with exit code 138
    let masterAddr = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    try {
         forceBasechain(masterAddr);
         require(false, "forceBasechain did not throw on masterchain address");
    } catch (exitCode) {
         require(exitCode == 138, "Unexpected exit code for forceBasechain on masterchain address");
    }
}

// Test conversion from compile-time constant literal to Address
fun testAddressLiteral() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    require(a.toString() == "UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo", "Address literal conversion mismatch");
}

fun runExtraTests() {
    testForceBasechain();
    testAddressLiteral();
}
