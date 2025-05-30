contract B(x: Int) {
    // Contract using contract parameters (no init function allowed)
}

contract TestBParamInitOf {
    receive() {
        // Valid usage: obtaining the initial state of a parameterized contract
        let state = initOf B(42);
    }
}
