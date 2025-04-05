/* Test 1: Valid if-else statement with block scopes */
contract Test1 {
    receive() {
        let a: Int = 10;
        if (a > 5) {
            a = a + 1;
        } else {
            a = a - 1;
        }
        dump(a);
    }
}
