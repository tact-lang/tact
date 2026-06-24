contract TestAddressLiteral {
    // Test conversion from a string literal to an Address and then converting it back to string.
    fun testLit() : Bool {
        let a = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
        let s = a.toString();
        // Check that the resulting string is non-empty
        return s != "";
    }

    receive() {}
}
