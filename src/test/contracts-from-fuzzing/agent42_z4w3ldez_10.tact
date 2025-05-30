extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMutate {
    fun test(): Int {
         let a: Int = 10;
         a.inc();
         return a;
    }
    receive() {
         dump(self.test());
         cashback(sender());
    }
}
