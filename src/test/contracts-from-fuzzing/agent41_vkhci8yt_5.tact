trait T1 {
    // Abstract function to be implemented by inheriting contracts
    abstract fun f(): Int;
}

trait T2 {
    // Virtual function that can be overridden
    virtual fun f(): Int {
        return 123;
    }
}

contract D() with T1, T2 {
    // Override the ambiguous function f from T1 and T2 to resolve conflict
    override fun f(): Int {
        return 999;
    }

    // Getter function to test the behavior of f()
    get fun test(): Int {
        return self.f();
    }

    // Dummy receiver so that the contract is considered 'used'
    receive() {
        cashback(sender());
    }
}
