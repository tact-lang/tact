message M { x: Int as uint8; }

trait TMsg {
    // Abstract function: must be overridden
    abstract fun process(msg: M);
}

contract CM() with TMsg {
    // Provide implementation for the abstract function
    override fun process(msg: M) {
        // For this test, simply do nothing
    }

    receive(msg: M) {
        // Proper invocation of the trait function via self.reference
        self.process(msg);
        cashback(sender());
    }
}
