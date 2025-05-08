extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMut() {
    fun testMut() {
        let a = 10;
        a.inc(); // should mutate a to 11
        dump(a); // expected output: 11
    }
    
    receive() {
        self.testMut();
        cashback(sender());
    }
}
