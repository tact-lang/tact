trait MyTrait {
    // Abstract constant: must be defined in inheriting contract
    abstract const x: Int;

    // Virtual constant: default provided, but can be overridden
    virtual const y: Int = 5;
}

contract MyContract() with MyTrait {
    // Must override abstract constant x
    override const x: Int = 10;

    // Optionally override virtual constant y
    override const y: Int = 20;

    receive() {
        // Minimal receiver function, doing nothing
        return;
    }
}
