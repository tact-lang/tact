fun test_asSlice(): String {
    let str: String = "Test string";
    let s: Slice = str.asSlice();
    return s.asString();
}

contract TestContract {
    receive() {
        test_asSlice();
    }
}
