trait Incrementor {
    fun inc(x: Int): Int {
        return x + self.increment;
    }
    abstract const increment: Int;
}

trait Doubler {
    fun dbl(x: Int): Int {
        return x * 2;
    }
}

contract Calculator() with Incrementor, Doubler {
    override const increment: Int = 5;
    receive() {
         let result = self.inc(10) + self.dbl(5);
         dump(result); // expected 25
    }
}
