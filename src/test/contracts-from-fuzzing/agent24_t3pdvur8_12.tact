contract Test {
    receive() {
         // Test string -> slice -> string roundtrip conversion
         let s: String = "Hello, Tact!";
         let s2: String = s.asSlice().asString();
         dump(s == s2);
    }
}
