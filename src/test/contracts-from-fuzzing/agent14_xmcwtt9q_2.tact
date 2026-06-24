contract SimpleContract {
    init() {}
    receive() {}
}

contract UsingInitOf {
    receive() {
        // Get the initial state for the contract "SimpleContract"
        let initPkg = initOf SimpleContract();
        let addr = contractAddress(initPkg);
        // Successfully computed address without doing a null comparison
    }
}
