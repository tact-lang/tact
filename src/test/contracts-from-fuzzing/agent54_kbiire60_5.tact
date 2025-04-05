contract TestHexLiteral {
    receive() {
         let a: Int = 0xAB; // hexadecimal literal, equivalent to 171 in decimal
         dump(a);
    }
}
