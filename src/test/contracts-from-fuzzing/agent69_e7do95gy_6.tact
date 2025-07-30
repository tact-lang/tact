contract TestTonConversion {
    receive() {
        // Test 5: Using ton() function for compile-time conversion of string to Int (nanoToncoin)
        let one: Int = ton("1");            // expected 10^9
        let pointOne: Int = ton("0.1");       // expected 10^8
        let nano: Int = ton("0.000000001");   // expected 1
    }
}
