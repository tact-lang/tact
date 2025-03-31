contract B(x: Int) {
    receive() {}
}

contract TestBParameter {
    receive() {
        // Valid usage of initOf for a contract with contract parameters (and without an init() function)
        let si = initOf B(42);
    }
}
