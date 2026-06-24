extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestExt() {
    fun test() {
         let x = 10;
         x.inc();
         dump(x); // expected output: 11
    }
    
    receive() {
         self.test();
         cashback(sender());
    }
}
