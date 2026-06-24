trait FilterTrait {
    // Virtual function can be overridden
    virtual fun filterMessage(): Bool {
        return true;
    }

    // Abstract function must be implemented by inheriting contracts
    abstract fun specialFilter(): Bool;
}

contract Filter with FilterTrait {
    // Override the virtual function
    override fun filterMessage(): Bool {
        return false;
    }

    // Implement the abstract function
    override fun specialFilter(): Bool {
        return true;
    }

    // Dummy receiver to make contract valid
    receive() {
        // No op
    }
}
