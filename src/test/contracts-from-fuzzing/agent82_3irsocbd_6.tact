contract TestUnaryBitwiseNot {
    receive() {
         // Test unary bitwise not operator
         dump(~42);      // Expected: ~42
         dump(~(~42));   // Expected: 42
    }
}

contract TestBitwiseOperators {
    receive() {
         // Test binary bitwise operators on Int values
         dump(14 & 7);   // expected: 6  (1110 & 0111 = 0110)
         dump(14 | 7);   // expected: 15 (1110 | 0111 = 1111)
         dump(14 ^ 7);   // expected: 9  (1110 ^ 0111 = 1001)
    }
}

contract TestLogicalOperators {
    receive() {
         // Test binary logical operators on Bool values
         dump(true && false); // expected: false
         dump(true || false); // expected: true
    }
}
