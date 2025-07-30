trait MyTrait {
    // Abstract function: must be implemented by the contract
    abstract fun abstractFunc(): Int;

    // Virtual function with default implementation
    virtual fun virtualFunc(): Int {
        return 100;
    }
}

contract MyContract() with MyTrait {
    // Override abstract function
    override fun abstractFunc(): Int {
        return 123;
    }

    // Override virtual function
    override fun virtualFunc(): Int {
        return self.abstractFunc() + 10;
    }

    receive() {
        dump(self.abstractFunc());
        dump(self.virtualFunc());
        cashback(sender());
    }
}
