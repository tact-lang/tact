contract SomeContract { }

// Advanced tests for contract address functionality

// 1. Using a computed negative chain value that resolves to -1 (masterchain)
fun dynamicNegativeChain() {
    let chain = -2 + 1; // equals -1
    let a = newAddress(chain, 0x123456789ABCDEF123456789ABCDEF123456789ABCDEF123456789ABCDEF1234);
}

// 2. Using computed expressions for chain id and hash
fun dynamicChainComputation() {
    let chain = 0;
    let hash = 123456 + 0; // remains 123456
    let a = newAddress(chain, hash);
}

// 3. Checking that swapping code and data in contract address computation yields a different result
fun testSwappedContractAddress() {
    let s = initOf SomeContract();
    let a1 = contractAddress(s);
    let a2 = contractAddressExt(0, s.data, s.code);
    require(a1 != a2, "Swapped code and data should produce different addresses");
}

// 4. Testing Address.toString on an address created with newAddress
fun testNewAddressToString() {
    let a = newAddress(0, 0x123456789ABCDEF123456789ABCDEF123456789ABCDEF123456789ABCDEF1234);
    let s = a.toString();
}

// Aggregate function to run advanced tests
fun runAdvancedTests() {
    dynamicNegativeChain();
    dynamicChainComputation();
    testSwappedContractAddress();
    testNewAddressToString();
}
