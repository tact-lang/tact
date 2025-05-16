contract Test {
    receive() {
        // Test 5: Using an empty string literal
        dump("".asSlice().asString());
    }
}
