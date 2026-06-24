contract SomeContract { }

// Use require as per documentation for error checking

// 1. Valid newAddress usage on workchain 0
fun validNewAddress() {
    let a = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// 2. Valid newAddress usage on masterchain (-1) with maximal hash value
fun validMasterchainNewAddress() {
    let a = newAddress(-1, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
}

// 3. newAddress with edge hash value 0
fun newAddressEdgeHash() {
    let a = newAddress(0, 0);
}

// 4. Contract address computation via contractAddress and contractAddressExt
fun testContractAddrEquality() {
    let s = initOf SomeContract();
    let a1 = contractAddress(s);
    let a2 = contractAddressExt(0, s.code, s.data);
    require(a1 == a2, "Mismatch between contractAddress and contractAddressExt");
}

// 5. Testing Address.asSlice: conversion to Slice should be consistent
fun testAddressAsSlice() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s1 = a.asSlice();
    let s2 = beginCell().storeAddress(a).asSlice();
    require(s1 == s2, "asSlice conversion mismatch");
}

// 6. Testing Address.toString conversion
fun testAddressToString() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s: String = a.toString();
}

// 7. Testing BasechainAddress helpers: emptyBasechainAddress and newBasechainAddress
fun testBasechainHelpers() {
    let emptyAddr = emptyBasechainAddress();
    require(emptyAddr.hash == null, "emptyBasechainAddress did not yield a null hash");
    let newAddr = newBasechainAddress(123456);
}

// Aggregate function to call all tests
fun runTests() {
    validNewAddress();
    validMasterchainNewAddress();
    newAddressEdgeHash();
    testContractAddrEquality();
    testAddressAsSlice();
    testAddressToString();
    testBasechainHelpers();
}
