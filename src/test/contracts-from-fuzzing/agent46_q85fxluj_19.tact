contract TestModulo {
    receive() {
         // Test modulo operator: Expected: 10 % 3 = 1, and (-10) % 3 = 2
         dump(10 % 3);
         dump((-10) % 3);
    }
}
