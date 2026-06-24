contract Test {
    receive() {
         // Testing hashData on a string with various escape sequences and unicode characters
         let s: String = "Line1\nLine2\tTabbed \x20Space \u0041 and \u{1F4A9}";
         let h: Int = s.hashData();
    }
}
