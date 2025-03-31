contract RecursiveSelf {
    // Test recursive self-reference via initOf within a receive function
    receive() {
        // use initOf to get its own initial state
        let selfInit = initOf RecursiveSelf();
        // compute the contract address from its own init package
        let addr = contractAddress(selfInit);
    }
}
