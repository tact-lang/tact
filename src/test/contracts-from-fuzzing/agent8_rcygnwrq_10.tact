contract Test {
    receive() {
         // Test conversion from String to Slice and back to String
         let s: String = "Test string";
         let sl: Slice = s.asSlice();
         let s2: String = sl.asString();
    }
}
