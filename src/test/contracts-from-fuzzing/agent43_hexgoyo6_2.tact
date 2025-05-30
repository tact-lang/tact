trait A {
    // Abstract function, must be implemented by inheritors
    abstract fun absfun(): Int;

    // Virtual function with a default implementation
    virtual fun virtfun(): Int {
        return 10;
    }
}

contract B() with A {
    // Override the abstract function
    override fun absfun(): Int {
        return 20;
    }

    // Override the virtual function
    override fun virtfun(): Int {
        return 30;
    }

    receive() {
        let result = self.absfun() + self.virtfun();
        dump(result); // Expected 20 + 30 = 50
    }
}
