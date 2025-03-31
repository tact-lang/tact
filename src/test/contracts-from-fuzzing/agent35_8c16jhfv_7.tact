contract C(x: Int) {
    receive() {}
}

contract TestParam {
    receive() {
        // Valid usage of initOf with contract parameters
        let state = initOf C(10);
    }
}
