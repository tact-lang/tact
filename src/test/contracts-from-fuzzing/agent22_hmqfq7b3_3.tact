trait A {
    abstract fun foo(): Int;
    virtual fun bar(): Int {
        return 10;
    }
    virtual const V: Int = 50;
}

trait B {
    abstract fun baz(): Int;
    virtual fun qux(): Int {
        return 20;
    }
    abstract const W: Int;
}

contract D() with A, B {
    override fun foo(): Int { 
        return 100; 
    }
    override fun baz(): Int { 
        return 200; 
    }
    override const W: Int = 300;
    override fun bar(): Int { 
        return 110; 
    }
    
    receive() {
        let result = self.foo() + self.bar() + self.baz() + self.qux() + self.V + self.W;
        // Expected: 100 + 110 + 200 + 20 + 50 + 300 = 780
        self.reply(result.toString().asComment());
    }
    
    override fun reply(body: Cell?) {
        // Dummy implementation.
    }
}
