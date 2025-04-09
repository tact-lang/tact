trait TDynamic {
    // Abstract function which must be provided by inheriting contract
    abstract fun dynamicVal(): Int;

    // Function that uses the abstract function
    fun check(): Int {
        return self.dynamicVal() * 2;
    }
}

contract DynamicImpl() with TDynamic {
    // Implement the abstract function
    override fun dynamicVal(): Int {
        return 42;
    }
    
    // Receiver that sends out the computed check value
    receive() {
        let x = self.check(); // Expected: 42 * 2 = 84
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: x.toString().asComment()
        });
    }
}
