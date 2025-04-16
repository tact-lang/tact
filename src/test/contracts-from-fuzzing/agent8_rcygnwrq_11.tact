contract Test {
    receive() {
         // Test usage of ascii() compile-time function on a string literal
         let hexValue: Int = ascii("abc");
    }
}
