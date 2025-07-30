contract TestAddressToString {
    // Test the toString extension method for Address
    fun test(a: Address) : Bool {
        let s = a.toString();
        // expecting a non-empty string representation
        return s != "";
    }
    // Minimal receive function
    receive() {}
}
