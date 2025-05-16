contract Test {
    receive() {
        // Test conversion between String and Slice using asSlice() and asString()
        let s: String = "Test Conversion";
        let slice_val: Slice = s.asSlice();
        if (s == slice_val.asString()) {
            return;
        } else {
            throw(1);
        }
    }
}
