contract TestContract {
    receive() {
        // Testing empty string literal
        let s: String = "";
        let _slice: Slice = s.asSlice();
    }
}
