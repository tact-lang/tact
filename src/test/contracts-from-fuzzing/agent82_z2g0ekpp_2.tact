contract TestIntArithmetic {
    fun test() {
        // Testing integer arithmetic: 3/2 should yield 1
        let x: Int = 3 / 2;
        dump(x); // expected output: 1
    }

    receive() {
        self.test();
    }
}
