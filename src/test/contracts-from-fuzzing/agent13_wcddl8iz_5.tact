trait A {
    abstract fun doIt(): Int;
}

trait B {
    abstract fun doIt(): Int;
}

contract C() with A, B {
    override fun doIt(): Int { return 42; }
    
    receive() {
        dump(self.doIt());
    }
}
