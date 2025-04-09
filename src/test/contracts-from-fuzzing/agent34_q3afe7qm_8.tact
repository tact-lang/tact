// Test 1: Basic if statement without else
contract Test1 {
    receive() {
        if (10 > 5) {
            dump(1);
        }
        dump(2);
    }
}
