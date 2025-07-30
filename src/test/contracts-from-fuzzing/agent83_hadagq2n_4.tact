fun test_asSlice() : String {
    let s : String = "Tact Test";
    let slice = s.asSlice();
    return slice.asString();
}

contract TestContract {
    receive() {
        test_asSlice();
    }
}
