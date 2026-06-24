trait A {
    abstract fun f(): Int;
}

trait B {
    abstract fun g(): Int;
}

contract D() with A, B {
    override fun f(): Int { return 10; }
    override fun g(): Int { return 20; }

    receive() { }
}
