contract TestEmptyString {
    receive() {
        // Test an empty string literal and verify that it can be cast to a slice
        let s: String = "";
        let sl: Slice = s.asSlice();
        sl;
    }
}
