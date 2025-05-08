trait Caller {
    // Declare an abstract worker function that must be implemented by inheriting contracts
    abstract fun worker(): Int;

    // callIt uses the worker function and adds 5 to its result
    fun callIt(): Int {
        let w = self.worker();
        return w + 5;
    }
}

contract TestContract() with Caller {
    // Implement the abstract worker function, for example, returning 10
    override fun worker(): Int {
        return 10;
    }

    receive() {
        // Call the inherited function callIt, expecting 10 + 5 = 15
        let result = self.callIt();
        require(result == 15, "Unexpected value from callIt");
        cashback(sender());
    }
}
