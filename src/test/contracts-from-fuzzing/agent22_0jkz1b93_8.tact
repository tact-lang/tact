/*
 Extended Fuzz Testing of Contract Addresses and Related Cell Operations in Tact

 This snippet extends our previous tests by exploring additional conversion functions, builder storage functions, and the parsing of variable-length addresses. These tests include:

 1. testAddressAsSliceEquality: Verifies that Address.asSlice() produces the same result as storing an Address into a cell and then extracting its slice.
 2. testStoreAddressInBuilder: Checks that storing an Address in a Builder works as documented.
 3. testStoreBasechainAddress: Uses storeBasechainAddress to store a BasechainAddress and then verifies that the resulting Address matches what newAddress produces.
 4. testChainConversion: Performs a chain of conversions (Address -> cell -> slice -> Address) to test consistency.
 5. testParseVarAddress: Constructs a cell containing a VarAddress with specified bit widths and then parses it with parseVarAddress.

These tests are designed to cover additional subtle edge cases not previously repeated and do not replicate known documented issues.
*/

// 1. Compare Address.asSlice() with cell storage conversion
fun testAddressAsSliceEquality(): Bool {
    let a: Address = newAddress(0, 55555);
    let slice1: Slice = a.asSlice();
    let cellFromAddress = beginCell().storeAddress(a).endCell();
    let slice2: Slice = cellFromAddress.asSlice();
    return slice1 == slice2;
}

// 2. Test Builder.storeAddress: store an Address and then retrieve its cell slice
fun testStoreAddressInBuilder(): Bool {
    let a: Address = newAddress(0, 77777);
    let b: Builder = beginCell().storeAddress(a);
    let cellFromBuilder = b.endCell();
    return cellFromBuilder.asSlice() == a.asSlice();
}

// 3. Test Builder.storeBasechainAddress: store a BasechainAddress and then retrieve as an Address
fun testStoreBasechainAddress(): Bool {
    let baseAddr: BasechainAddress = newBasechainAddress(88888);
    let b: Builder = beginCell().storeBasechainAddress(baseAddr);
    let s: Slice = b.endCell().asSlice();
    let addr: Address = s.asAddress(0);
    return addr == newAddress(0, 88888);
}

// 4. Test multiple chain conversions of an Address
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

// 5. Test parseVarAddress: build a cell with a VarAddress representation and parse it
fun testParseVarAddress(): Bool {
    // Construct a VarAddress as per documentation:
    //   - First, store a 3-bit prefix (here, 6) to signal VarAddress
    //   - Then, store the bit-length of the address, here we use 123 bits
    //   - Then, store a 32-bit workchain ID (we use 234)
    //   - Finally, store an address value occupying 123 bits (we use 345)
    let varAddrCell = beginCell()
        .storeUint(6, 3)      // VarAddress prefix
        .storeUint(123, 9)    // Bit-length of address part (123 bits)
        .storeUint(234, 32)   // Workchain ID for VarAddress
        .storeUint(345, 123)  // Address value occupying 123 bits
        .endCell();
    let s: Slice = varAddrCell.asSlice();
    let varAddr = parseVarAddress(s);
    // Check that the parsed values match the stored ones
    let addrVal: Int = varAddr.address.loadUint(123);
    return (varAddr.workchain == 234) && (addrVal == 345);
}

// Main function invoking all new tests
fun main(): Int {
    dump(testAddressAsSliceEquality());
    dump(testStoreAddressInBuilder());
    dump(testStoreBasechainAddress());
    dump(testChainConversion());
    dump(testParseVarAddress());
    return 0;
}
