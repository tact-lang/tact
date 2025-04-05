contract TestBitwiseAnd {
    receive() {
         // Testing bitwise AND operator on integers
         // Expected: 3 & 1 = 1, since 3 (11 binary) and 1 (01 binary) -> 01 (1)
         dump(3 & 1);
         // Testing another case: 255 & 0b00001111 = 15
         dump(255 & 0b00001111);
    }
}
