trait MyTrait {
    // Abstract function must be overridden
    abstract fun absFunc(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun virtualFunc(x: Int): Int {
        return x + 1;
    }
}

contract TestDefault() with MyTrait {
    // Overriding the abstract function
    override fun absFunc(x: Int): Int {
        return x * 3;
    }

    // This function simply calls the virtual function without overriding it
    fun test(): Int {
        // virtualFunc should return x+1 since it is not overridden
        return self.virtualFunc(10);
    }

    receive() {
        dump(self.test()); // expected output: 11
    }
}
