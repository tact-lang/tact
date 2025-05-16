trait MyTrait {
    // Abstract function that must be implemented by inheriting contracts
    abstract fun myAbstract(): Int;

    // Virtual function with a default implementation using myAbstract()
    virtual fun myVirtual(): Int {
        return self.myAbstract() + 100;
    }
}

contract TestContract() with MyTrait {
    // Override the abstract function from MyTrait
    override fun myAbstract(): Int {
        return 50;
    }

    // Optionally override the virtual function to change behavior
    override fun myVirtual(): Int {
        // For this test, add 200 instead of 100 to myAbstract()
        return self.myAbstract() + 200;
    }

    // Expose the result via a getter for testing purposes
    get fun result(): Int {
        return self.myVirtual();
    }

    // Dummy receiver so the contract is complete
    receive() {
        // No operation
    }
}
