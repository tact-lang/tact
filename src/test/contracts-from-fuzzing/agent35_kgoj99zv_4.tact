trait MyTrait {
    // Abstract function: must be overridden
    abstract fun greet(name: String): String;

    // Virtual function with a default implementation
    virtual fun farewell(name: String): String {
        // Since string concatenation isn't allowed, we return a fixed literal
        return "Goodbye";
    }
}

contract MyContract() with MyTrait {
    // Override the abstract function
    override fun greet(name: String): String {
        // Returning a literal constant as concatenation is not supported
        return "Hello";
    }

    receive() {
        // Invoke trait functions via the self reference
        let welcome = self.greet("Alice");
        let bye = self.farewell("Alice");
        dump(welcome);
        dump(bye);
        cashback(sender());
    }
}
