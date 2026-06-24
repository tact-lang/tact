contract TestBitwiseOperators {
    receive() {
         dump(~42);      // Expected: -43
         dump(5 & 3);     // 5: 101, 3: 011, result: 001 -> 1
         dump(5 ^ 3);     // 5: 101, 3: 011, result: 110 -> 6
         dump(5 | 3);     // 5: 101, 3: 011, result: 111 -> 7
    }
}
