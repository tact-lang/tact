extends mutates fun inc(self: Int) {
    self += 1;
}

contract MutateTest() {
    fun testMutate() {
        let a: Int = 5;
        a.inc();
        dump(a); // expected output: 6
    }
    receive() {
        self.testMutate();
        cashback(sender());
    }
}
