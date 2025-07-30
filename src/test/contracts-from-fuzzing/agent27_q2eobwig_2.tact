trait MyTrait {
    // Abstract function: must be overridden by implementing contract
    abstract fun trust(x: Int): Int;
}

contract Test() with MyTrait {
    // Override the abstract function from MyTrait
    override fun trust(x: Int): Int {
        return x + 1;
    }
    
    // Receiver function that calls the trait method using self.
    receive() {
        let y = self.trust(5);
        // Using dump() to emit value, assuming dump() is available
        dump(y);
    }
}
