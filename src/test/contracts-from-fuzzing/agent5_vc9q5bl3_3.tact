trait T {
    abstract fun foo(): Int;
    virtual fun bar(): Int {
        return 100;
    }
}

contract C() with T {
    override fun foo(): Int {
        return 42;
    }
    
    fun test(): Int {
        return self.foo() + self.bar();
    }
    
    receive() {
        self.test();
    }
}
