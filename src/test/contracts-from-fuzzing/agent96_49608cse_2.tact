contract TestContract {
    receive() {
        let s: String = "Test string";
        let slice1: Slice = s.asSlice();
    }
}
