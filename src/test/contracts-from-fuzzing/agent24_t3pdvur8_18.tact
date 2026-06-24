contract Test {
    receive() {
         // Testing string literal with null byte (\x00 escape)
         let s: String = "Null byte: \x00";
         dump(s);
    }
}
