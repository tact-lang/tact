contract TestMapArithmetic {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set key 0 using an arithmetic expression: 1/2 equals 0 in integer division
        self.m.set(0, 100);

        // Check existence using arithmetic expression as key
        if (self.m.exists(1 / 2)) {
            dump(1); // Expected: 1 (true branch)
        } else {
            dump(0);
        }

        // Also retrieve using arithmetic expression and assert using non-null assertion
        let value: Int = self.m.get(1 / 2)!!; // expected 100
        dump(value);
    }
}
