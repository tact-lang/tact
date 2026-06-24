/*
 Extended Fuzz Testing: Additional Address Storage and Builder Overflow

 This snippet extends our previous fuzz testing by adding tests that explore further compiler features:

 8. testStoreAddressOverflow: Attempts to store an Address into a nearly full Builder to trigger a cell overflow error (exit code 8).

 9. StoreAndGetContract: A contract that stores an Address in persistent state and returns its string representation via a getter. The receiver uses self.getStr() to reference the getter function.

Note: All tests are designed to explore edge cases without repeating known documented issues.
*/

// ---------- Previously defined tests (Tests 1 to 7) ----------

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

// ---------- New Tests ----------

// Test 8: Test storing an Address in a nearly full Builder to trigger cell overflow
fun testStoreAddressOverflow() {
    let a: Address = newAddress(0, 12345);
    let b: Builder = beginCell();
    // Pre-fill the builder with bits to approach cell capacity (approx 1023 bits total)
    // Here, we store 110 values of 9 bits each => 990 bits (an arbitrary approach to fill capacity)
    repeat (110) {
        b = b.storeUint(1, 9);
    }
    try {
       b.storeAddress(a);
    } catch (exitCode) {
       dump(exitCode); // Expected: exit code 8 (Cell overflow)
    }
}

// Test 9: Contract that stores an Address in persistent state and returns its string representation via a getter
contract StoreAndGetContract {
    stored: Address;
    
    init(x: Address) {
        self.stored = x;
    }
    
    // Getter that converts the stored address to a String
    get fun getStr(): String {
        return self.stored.toString();
    }
    
    receive() {
        // When receiving a message, dump the string representation using self.getStr()
        dump(self.getStr());
    }
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
    testStoreAddressOverflow();
    return 0;
}
