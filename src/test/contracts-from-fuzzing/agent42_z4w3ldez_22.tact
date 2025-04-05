trait A {
    abstract fun f(): Int;
}

trait B {
    abstract fun f(): Int;
}

contract Multi() with A, B {
    override fun f(): Int {
        return 100;
    }

    receive() {
        dump(self.f());
        cashback(sender());
    }
}
