contract TestHexLiteral {
    receive() {
         // Test hexadecimal literal: 0xABC should evaluate to 2748 in decimal
         dump(0xABC);
    }
}
