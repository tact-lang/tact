trait A {
    // f: adds 1 to the argument
    fun f(x: Int): Int { return x + 1; }
    // Virtual constant C with default 10
    virtual const C: Int = 10;
}

trait B with A {
    // g: calls f and adds the constant C
    fun g(x: Int): Int { return self.f(x) + self.C; }
    // Override constant C to 20
    override const C: Int = 20;
}

trait C with B {
    // Override f: multiplies argument by 2
    override fun f(x: Int): Int { return x * 2; }
    // Virtual function h: default implementation
    virtual fun h(x: Int): Int { return self.g(x) + self.f(x); }
    // Override constant C to 30
    override const C: Int = 30;
}

contract D(param: Int) with C {
    // Override h to use a different computation
    override fun h(x: Int): Int { return self.g(x) * 2; }

    receive() {
         // Access the contract parameter via self.param
         let result = self.h(self.param);
         dump(result);
         cashback(sender());
    }
}
