/*
   Extended Fuzz Testing of Contract Addresses in Tact
   This snippet further tests various documented functions and behaviors related to contract addresses:
   - newAddress, contractAddress, contractAddressExt
   - BasechainAddress utilities (emptyBasechainAddress, newBasechainAddress, contractBasechainAddress)
   - Conversions involving Address: asSlice, toString, and the inverse Slice.asAddressUnsafe
   - Equality comparisons and edge cases

   Note: Some tests intentionally cause compile-time errors (e.g., using an invalid workchain id with newAddress) and are commented out.
*/

// Dummy contract for initOf usage
contract DummyContract {}

///////////////////////////////
// Test Cases for Address Functions
///////////////////////////////

// Test 1: Valid newAddress usage with workchain id 0
fun testNewAddressValid0() {
    let a: Address = newAddress(0, 0x1234);
}

// Test 2: Valid newAddress usage with workchain id -1 (masterchain)
fun testNewAddressValidMinus1() {
    let a: Address = newAddress(-1, 0x12345678);
}

// Test 3: Invalid newAddress usage with workchain id not equal to 0 or -1
// This test is expected to fail at compile-time; hence, it remains commented out.
/*
fun testNewAddressInvalid() {
    let a: Address = newAddress(1, 0x1234); // Expected compile error
}
*/

// Test 4: Consistency between contractAddress and contractAddressExt
fun testContractAddressConsistency() {
    let s: StateInit = initOf DummyContract();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    if (!(addr1 == addr2)) { require(false, "Mismatch in contract address computations"); }
}

// Test 5: Address.asSlice conversion consistency
fun testAddressAsSlice() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s1: Slice = beginCell().storeAddress(a).asSlice();
    let s2: Slice = a.asSlice();
    if (!(s1 == s2)) { require(false, "Slice conversion via asSlice failed"); }
}

// Test 6: Address.toString conversion functionality
fun testAddressToString() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let str: String = a.toString();
    // We don't assert on str's content, just test that the conversion runs
}

// Test 7: Validate emptyBasechainAddress produces a BasechainAddress with null hash
fun testEmptyBasechainAddress() {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    if (emptyAddr.hash != null) { require(false, "emptyBasechainAddress should have null hash"); }
}

// Test 8: Create a new BasechainAddress with a typical 256-bit hash value
fun testNewBasechainAddress() {
    let b: BasechainAddress = newBasechainAddress(0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// Test 9: Derive a BasechainAddress from a contract's StateInit
fun testContractBasechainAddress() {
    // Use beginCell().endCell() to simulate valid Cell instances
    let code: Cell = beginCell().endCell();
    let data: Cell = beginCell().endCell();
    let s: StateInit = StateInit { code, data };
    let b: BasechainAddress = contractBasechainAddress(s);
}

// Test 10: Create a new BasechainAddress with an unusual negative hash value
fun testNewBasechainAddressNegative() {
    let b: BasechainAddress = newBasechainAddress(-1);
}

// Test 11: Conversion round-trip using Slice.asAddressUnsafe:
// Convert an Address to a Cell and back using Slice.asAddressUnsafe, and check equality
fun testSliceAsAddressUnsafe() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let cell: Cell = beginCell().storeAddress(a).endCell();
    let sl: Slice = cell.beginParse();
    let a2: Address = sl.asAddressUnsafe();
    if (!(a == a2)) { require(false, "Slice.asAddressUnsafe conversion failed"); }
}

// Test 12: Address and Cell conversion consistency
fun testAddressCellConversion() {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    // Store address in a cell, then convert to slice and back
    let cell: Cell = beginCell().storeAddress(a).endCell();
    let sl: Slice = cell.beginParse();
    let aRecovered: Address = sl.asAddressUnsafe();
    if (!(a == aRecovered)) { require(false, "Address recovery from cell failed"); }
}

// Optional Test 13: Testing behavior when provided an invalid address string
// This test might produce a compile-time or runtime error, so it is commented out
/*
fun testInvalidAddressString() {
    let a: Address = address("invalid_address_format");
}
*/

///////////////////////////////
// Main: Execute all tests (except those expected to fail)
///////////////////////////////
fun main() {
    testNewAddressValid0();
    testNewAddressValidMinus1();
    // testNewAddressInvalid();  // Expected compile-time error
    testContractAddressConsistency();
    testAddressAsSlice();
    testAddressToString();
    testEmptyBasechainAddress();
    testNewBasechainAddress();
    testContractBasechainAddress();
    testNewBasechainAddressNegative();
    testSliceAsAddressUnsafe();
    testAddressCellConversion();
    // testInvalidAddressString();  // Commented out
}
