trait X {
    abstract fun f(): Int;
}

trait Y {
    abstract fun f(): Int;
}

contract Multi() with X, Y {
    override fun f(): Int {
        return 42;
    }
    
    receive() {
        dump(self.f());
        cashback(sender());
    }
}
