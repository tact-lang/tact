/*
 Extended Fuzz Testing of Contract Addresses, Map Keys, and Multi-Address Storage

 This snippet extends our previous tests by exploring further conversion functions, builder storage, variable-length address parsing, and map key usage with Address types. These tests include:

 1. testAddressAsSliceEquality: Verifies that Address.asSlice() produces the same result as storing an Address into a cell and then extracting its slice.
 2. testStoreAddressInBuilder: Checks that storing an Address in a Builder works as documented.
 3. testStoreBasechainAddress: Uses storeBasechainAddress to store a BasechainAddress and then verifies that the resulting Address matches what newAddress produces.
 4. testChainConversion: Performs multiple conversions (Address -> cell -> Slice -> Address) to test consistency.
 5. testParseVarAddress: Constructs a cell containing a VarAddress with specified bit widths and then parses it with parseVarAddress.
 6. testAddressMapKey: Uses Address as key in a map, verifying that stored values are correctly retrieved.
 7. testMultipleAddressStorage: Stores two addresses in a single cell and then retrieves them sequentially.
*/

// Test 1: Compare Address.asSlice() with cell storage conversion
fun testAddressAsSliceEquality(): Bool {
    let a: Address = newAddress(0, 55555);
    let slice1: Slice = a.asSlice();
    let cellFromAddress = beginCell().storeAddress(a).endCell();
    let slice2: Slice = cellFromAddress.asSlice();
    return slice1 == slice2;
}

// Test 2: Test Builder.storeAddress: store an Address and then retrieve its cell slice
fun testStoreAddressInBuilder(): Bool {
    let a: Address = newAddress(0, 77777);
    let b: Builder = beginCell().storeAddress(a);
    let cellFromBuilder = b.endCell();
    return cellFromBuilder.asSlice() == a.asSlice();
}

// Test 3: Test Builder.storeBasechainAddress: store a BasechainAddress and then retrieve as an Address
fun testStoreBasechainAddress(): Bool {
    let baseAddr: BasechainAddress = newBasechainAddress(88888);
    let b: Builder = beginCell().storeBasechainAddress(baseAddr);
    let s: Slice = b.endCell().asSlice();
    let addr: Address = s.asAddress(0);
    return addr == newAddress(0, 88888);
}

// Test 4: Test multiple chain conversions of an Address
fun testChainConversion(): Bool {
    let a: Address = newAddress(0, 101010);
    let cell1 = beginCell().storeAddress(a).endCell();
    let slice1 = cell1.asSlice();
    let a2: Address = slice1.asAddress(0);
    let cell2 = beginCell().storeAddress(a2).endCell();
    let slice2 = cell2.asSlice();
    let a3: Address = slice2.asAddress(0);
    return (a == a2) && (a2 == a3);
}

// Test 5: Test parseVarAddress: build a cell with a VarAddress representation and parse it
fun testParseVarAddress(): Bool {
    // Construct a VarAddress as per documentation:
    //   - Store a 3-bit prefix (6) to signal VarAddress
    //   - Store the bit-length of the address (123 bits)
    //   - Store a 32-bit workchain ID (234)
    //   - Store an address value occupying 123 bits (345)
    let varAddrCell = beginCell()
        .storeUint(6, 3)      // VarAddress prefix
        .storeUint(123, 9)    // Bit-length
        .storeUint(234, 32)   // Workchain ID
        .storeUint(345, 123)  // Address value
        .endCell();
    let s: Slice = varAddrCell.asSlice();
    let varAddr = parseVarAddress(s);
    let addrVal: Int = varAddr.address.loadUint(123);
    return (varAddr.workchain == 234) && (addrVal == 345);
}

// Test 6: Test using Address as a key in a map
fun testAddressMapKey(): Bool {
    let a: Address = newAddress(0, 99999);
    let b: Address = newAddress(0, 88888);
    // Create a map with Address as key and Int as value
    let m: map<Address, Int> = emptyMap();
    m.set(a, 100);
    m.set(b, 200);

    // Retrieve values and check equality
    let valA: Int? = m.get(a);
    let valB: Int? = m.get(b);
    if (valA == null || valB == null) {
        return false;
    } else {
        return (valA!! == 100) && (valB!! == 200);
    }
}

// Test 7: Test storing multiple addresses in one cell and retrieving them sequentially
fun testMultipleAddressStorage(): Bool {
    let a: Address = newAddress(0, 1234);
    let b: Address = newAddress(0, 5678);
    // Store two addresses in a single cell
    let cellCombined = beginCell()
        .storeAddress(a)
        .storeAddress(b)
        .endCell();
    let s: Slice = cellCombined.asSlice();
    let aLoaded: Address = s.loadAddress();
    let bLoaded: Address = s.loadAddress();
    return (a == aLoaded) && (b == bLoaded);
}

// Main function invoking all tests
fun main(): Int {
    dump(testAddressAsSliceEquality());
    dump(testStoreAddressInBuilder());
    dump(testStoreBasechainAddress());
    dump(testChainConversion());
    dump(testParseVarAddress());
    dump(testAddressMapKey());
    dump(testMultipleAddressStorage());
    return 0;
}
