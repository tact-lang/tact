contract Test {
    receive() {
         // Testing string equality
         let s1: String = "foo";
         let s2: String = "foo";
         dump(s1 == s2);
    }
}
