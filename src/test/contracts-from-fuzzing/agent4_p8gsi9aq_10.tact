contract TestFunctionChaining {
    receive() {
        // Chain function calls: toString() -> asSlice() -> asString()
        let s: String = 42.toString().asSlice().asString();
    }
}
