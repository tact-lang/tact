contract Test {
    // Test 11: Getter with explicit return statements
    get fun g(): Int {
         if (1 == 1) {
             return 5;
         }
         return 10;
    }

    receive () {}
}
