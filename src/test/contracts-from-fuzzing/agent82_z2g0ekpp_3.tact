// Test 1: Integer arithmetic
contract TestIntArithmetic {
    fun test() {
        // Testing integer division: 3/2 should yield 1
        let x: Int = 3 / 2;
        dump(x); // expected output: 1
    }

    receive() {
        self.test();
    }
}
