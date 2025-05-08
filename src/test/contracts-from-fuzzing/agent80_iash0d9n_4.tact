fun test(): Int {
    // Test conversion from String to Slice and back to String
    let original: String = "TactFuzz";
    let slice: Slice = original.asSlice();
    let roundtrip: String = slice.asString();
    // Compare hashData values as a proxy for equality
    if (original.hashData() != roundtrip.hashData()) {
        // If they differ, return error code 1
        throw(1);
    }
    return 42;
}

contract TestContract {
    receive() {
        test();
    }
}
