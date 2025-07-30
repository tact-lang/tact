trait AbstractTrait {
    // Declare an abstract function that must be implemented
    abstract fun doSomething(x: Int): Int;
}

trait DefaultTrait {
    // Provide a default implementation for a function with the same name
    fun doSomething(x: Int): Int {
        return x + 100;
    }
}

contract OOPTest(a: Int) with AbstractTrait, DefaultTrait {
    // Here we override the abstract function from AbstractTrait.
    // Since DefaultTrait already provides an implementation for doSomething,
    // this override should override both if there's a conflict.
    override fun doSomething(x: Int): Int {
        // Combine the default behavior with contract-specific logic
        return x + self.a;
    }

    receive() {
        let result = self.doSomething(23);
        // Though we don't output it, the test is that overriding works
    }

    get fun result(): Int {
        return self.doSomething(23);
    }
}
