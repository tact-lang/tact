contract Recursive {
    x: Int;
    init() {
        // Initialize self using initOf on the same contract
        let selfInit = initOf Recursive();
        let addr_from_init = contractAddress(selfInit);
        let curr_addr = myAddress();
        // Although they might not be equal at runtime, for testing we simply
        // perform a dummy assignment
        self.x = 42;
    }
    get fun getX(): Int { return self.x; }
}
