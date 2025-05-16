trait A {
    virtual const X: Int = 10;
    fun f(): Int { return self.X + 5; }
}

trait B {
    virtual const X: Int = 20;
}

contract C() with A, B {
    // Resolving conflict by overriding constant X
    override const X: Int = 100;
    
    receive() {
        dump(self.f()); // Expected output: 100 + 5 = 105
    }
}
