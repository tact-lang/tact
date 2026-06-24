contract TestContract {
    receive() {
        // Test 3: String.asSlice() and asString() consistency
        let s: String = "Test String";
        let t: String = s.asSlice().asString();
        if (s != t) {
            throw(1);
        }
    }
}
