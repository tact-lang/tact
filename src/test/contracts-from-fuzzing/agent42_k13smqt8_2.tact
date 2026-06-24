trait A {
    abstract fun foo(): Int;
}

contract TestContract() with A {
    override fun foo(): Int {
        return 42;
    }
    
    receive() {
        dump(self.foo());
    }
}
