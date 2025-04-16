trait A {
    abstract fun foo(): Int;
}

trait B {
    abstract fun foo(): Int;
}

contract C() with A, B {
    override fun foo(): Int {
        return 100;
    }

    receive() {
        // minimal receiver
    }
}
