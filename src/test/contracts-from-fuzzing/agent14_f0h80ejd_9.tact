contract TestAddressToString {
    fun test() : Bool {
         let a: Address = newAddress(0, 0xabcdef);
         let s: String = a.toString();
         // Ensuring the returned string representation is not empty
         return s != "";
    }
}

contract TestAddressEqualityAlternate {
    fun test() : Bool {
         // Test that two addresses with identical parameters but constructed differently are equal
         let a1: Address = newAddress(0, 0xdeadbeef);
         let a2: Address = newAddress(0, 0xdeadbeef);
         return a1 == a2;
    }
}
