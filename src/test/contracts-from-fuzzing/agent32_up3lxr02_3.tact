trait MyTrait {
    // Abstract function: must be overridden in inheriting contracts
    abstract fun absFunc(x: Int): Int;

    // Virtual function: default implementation provided, can be overridden
    virtual fun virtualFunc(x: Int): Int {
        return x + 1;
    }
}

contract TestContract() with MyTrait {
    // Overriding the abstract function
    override fun absFunc(x: Int): Int {
        return x * 2;
    }

    // Overriding the virtual function
    override fun virtualFunc(x: Int): Int {
        return x * 3;
    }

    // A helper function to combine results
    fun test(): Int {
        // Expected: absFunc(10) = 10*2 = 20; virtualFunc(10) = 10*3 = 30; total = 50
        return self.absFunc(10) + self.virtualFunc(10);
    }

    receive() {
        dump(self.test());
    }
}
