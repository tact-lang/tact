struct TestResults {
    roundtrip: Bool;
    toStringResult: String;
    emptyBasechain: Bool;
    newBasechain: Bool;
    sameBasechain: Bool;
    sliceConsistency: Bool;
}

contract TestContract {
    // A simple contract for basechain address comparison testing
    init() { }
}

// Test 1: Verify round-trip conversion of an address via asSlice and back
fun testAddressRoundtrip(): Bool {
    let a: Address = myAddress();
    let builder = beginCell().storeAddress(a);
    let cell: Cell = builder.endCell();
    let sl: Slice = cell.asSlice();
    let a2: Address = sl.asAddress(0);
    return a == a2;
}

// Test 2: Verify that Address.toString returns a non-empty string
fun testAddressToString(): String {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    return a.toString();
}

// Test 3: Verify emptyBasechainAddress yields a BasechainAddress with null hash
fun testEmptyBasechainAddress(): Bool {
    let b: BasechainAddress = emptyBasechainAddress();
    return b.hash == null;
}

// Test 4: Verify newBasechainAddress creates a BasechainAddress with a non-null hash
fun testNewBasechainAddress(): Bool {
    let b: BasechainAddress = newBasechainAddress(123456789);
    return b.hash != null;
}

// Test 5: Use hasSameBasechainAddress to compare contract's basechain address with sender
fun testSameBasechainComparison(): Bool {
    let s: StateInit = initOf TestContract();
    return s.hasSameBasechainAddress(sender());
}

// Test 6: Store an address in a cell and then retrieve its slice directly with asSlice
fun testAddressSliceConsistency(): Bool {
    let a: Address = myAddress();
    let cell: Cell = beginCell().storeAddress(a).endCell();
    let sliceFromCell: Slice = cell.asSlice();
    let sliceDirect: Slice = a.asSlice();
    return sliceFromCell == sliceDirect;
}

// Combined entry point that collects results into a struct
fun runTests(): TestResults {
    return TestResults{
        roundtrip: testAddressRoundtrip(),
        toStringResult: testAddressToString(),
        emptyBasechain: testEmptyBasechainAddress(),
        newBasechain: testNewBasechainAddress(),
        sameBasechain: testSameBasechainComparison(),
        sliceConsistency: testAddressSliceConsistency()
    };
}
