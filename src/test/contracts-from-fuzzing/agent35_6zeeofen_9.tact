contract ParamContract(a: Int) {
    // Contract with parameters - no init() allowed implicitly
    // The contract parameters are used to set up the initial state implicitly
}

contract Tester2 {
    receive() {
        // Correct usage of initOf with parameters
        let pkg = initOf ParamContract(10);
        let addr = contractAddress(pkg);
    }
}
