fun test_asSlice(): Bool {
    // Testing conversion of String to Slice and back to String
    let original: String = "Convert me";
    let slice_val: Slice = original.asSlice();
    let converted: String = slice_val.asString();
    return original == converted;
}

contract TestContract {
    receive() {
        test_asSlice();
    }
}
