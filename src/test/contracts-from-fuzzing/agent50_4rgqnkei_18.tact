contract TestPrecedence() {
    fun test() {
         let five = 5;
         let r = ~(-five); // as described in the docs, should yield 4
         dump(r);        // expect output: 4
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
