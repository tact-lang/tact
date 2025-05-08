trait A {
    abstract fun f(): Int;
}

trait B {
    abstract fun f(): Int;
}

contract C() with A, B {
    override fun f(): Int {
        return 42;
    }
    
    receive() {
        let x = self.f();
    }
}
