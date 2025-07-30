trait TA {
    abstract fun f(): Int;
}

trait TB with TA {
    override fun f(): Int {
         return 5;
    }
}

trait TC with TA {
    override fun f(): Int {
         return 7;
    }
}

contract Conflicting() with TB, TC {
    // Because TB and TC provide conflicting f(), we MUST override it.
    override fun f(): Int {
         return 100;
    }

    receive() {
         dump(self.f());
         cashback(sender());
    }
}
