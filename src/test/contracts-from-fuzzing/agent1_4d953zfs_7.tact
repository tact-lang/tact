trait T1 {
    // Virtual constant with default value
    virtual const c1: Int = 5;

    // Virtual function that adds constant c1 to argument
    virtual fun inc(a: Int): Int {
         return a + self.c1;
    }
}

trait T2 with T1 {
    // Override c1 from T1
    override const c1: Int = 7;
    // Define an additional virtual constant
    virtual const c2: Int = 3;

    // Virtual function that calls inc() and then adds c2
    virtual fun incTwice(a: Int): Int {
         return self.inc(a) + self.c2;
    }
}

contract ChainedTest(x: Int) with T2 {
    // 'x' becomes a persistent state variable accessible as self.x
    receive() {
         // Expected: self.inc(self.x) returns self.x + 7, then incTwice returns (self.x + 7) + 3 = self.x + 10
         let res = self.incTwice(self.x);
         // Use result in a dummy expression to avoid unused variable warnings
         let _ = res;
         cashback(sender());
    }
}
