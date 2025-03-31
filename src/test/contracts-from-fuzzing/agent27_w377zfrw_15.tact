fun test_empty_str(): String {
    let s: String = "";
    let slice: Slice = s.asSlice();
    return slice.asString();
}

contract TestContract {
    receive() {
        test_empty_str();
    }
}
