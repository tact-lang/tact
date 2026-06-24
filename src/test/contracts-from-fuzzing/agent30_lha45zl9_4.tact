trait TraitA {
    // Abstract function: must be implemented by inheriting contract
    abstract fun f(x: Int): Int;

    // Virtual function using self.f()
    virtual fun g(x: Int): Int {
        return self.f(x) + 1;
    }
}

trait TraitB with TraitA {
    // Provide implementation for the abstract function f(x)
    override fun f(x: Int): Int {
        return x * 3;
    }
}

contract ContractTest2() with TraitB, TraitA {
    receive() {
        let a: Int = self.f(2); // Expected: 2 * 3 = 6
        let b: Int = self.g(2); // Expected: 6 + 1 = 7

        dump(a);
        dump(b);

        cashback(sender());
    }
}
