contract TestContract {
    receive() {
        let s: String = "Hello";
        let slice: Slice = s.asSlice();
    }
}