contract BlockExprTest {
    fun test() {
        let a = 10;
        {
            // a is accessible here
            let b = a + 1; // expected: 11
            dump(b);
        }
        // Outside block, a is still 10
        dump(a);
    }

    receive() {
        self.test();
    }
}
