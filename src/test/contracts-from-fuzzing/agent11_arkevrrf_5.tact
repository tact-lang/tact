/* Test 5: Getter with conditional return */
contract C1 {
    get fun getVal(): Int {
        if (now() % 2 == 0) {
            return 100;
        }
        return 200;
    }
}
