/* Test 1: Valid usage of newAddress with workchain 0 */
fun testNewAddressValid() : Address {
    // Using a sample hash value (256-bit hash simulated as hexadecimal literal)
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

/* Test 3: Compute contract address using contractAddress and contractAddressExt.
   Here we define a dummy contract, get its StateInit and compute its address. */
contract Dummy {}

fun testContractAddress() : Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2; // should be true
}

/* Test 4: Testing Address.asSlice by comparing two ways to obtain a Slice from an Address
   (reference documentation in docs_ref_core-addresses.md) */
fun testAddressAsSlice() : Bool {
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    let sliceFromCell: Slice = beginCell().storeAddress(a).asSlice();
    let sliceDirect: Slice = a.asSlice();
    return sliceFromCell == sliceDirect;
}

/* Test 5: Testing Address.toString conversion (documentation from docs_ref_core-addresses.md) */
fun testAddressToString() : String {
    let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return a.toString();
}

/* Test 6: Testing emptyBasechainAddress to create an empty basechain address (Available since Tact 1.6) */
fun testEmptyBasechainAddress() : Bool {
    let addr: BasechainAddress = emptyBasechainAddress();
    return addr.hash == null;
}

/* Test 7: Testing newBasechainAddress with a provided hash value */
fun testNewBasechainAddress() : Bool {
    let addr: BasechainAddress = newBasechainAddress(0xDEADBEEF);
    return addr.hash == 0xDEADBEEF;
}

/* Test 8: Testing equality of two addresses generated from the same parameters */
fun testAddressEquality() : Bool {
    let a: Address = newAddress(0, 0x123456789ABCDEF);
    let b: Address = newAddress(0, 0x123456789ABCDEF);
    return a == b;
}

/* Test 9: Testing newAddress with masterchain identifier -1 (which should be allowed) */
fun testNewAddressMasterchain() : Address {
    return newAddress(-1, 0x11223344556677889900);
}

/* Test 10: Testing address serialization: storing an Address in a cell and then retrieving it */
fun testAddressSerialization() : Bool {
    let a: Address = newAddress(0, 0xABCDEF);
    let cell: Cell = beginCell().storeAddress(a).endCell();
    let slice: Slice = cell.beginParse();
    let a2: Address = slice.loadAddress();
    return a == a2;
}

/* Test 11: Using contractAddressExt with arbitrary cell values for code and data; while not semantically meaningful, it tests boundary conditions.
   Note: This test may not produce a meaningful address but should compile if the types are correct. */
fun testContractAddressExt() : Address {
    let dummyCell: Cell = beginCell().endCell();
    return contractAddressExt(0, dummyCell, dummyCell);
}

// Dummy main function to allow compilation
fun main() {
    // We simply call tests to check they compile; actual runtime verification is done at runtime
    let _ = testNewAddressValid();
    let _ = testContractAddress();
    let _ = testAddressAsSlice();
    let _ = testAddressToString();
    let _ = testEmptyBasechainAddress();
    let _ = testNewBasechainAddress();
    let _ = testAddressEquality();
    let _ = testNewAddressMasterchain();
    let _ = testAddressSerialization();
    let _ = testContractAddressExt();
}
