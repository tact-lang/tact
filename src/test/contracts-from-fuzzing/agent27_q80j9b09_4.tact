contract C(x: Int) {
    receive() {}
}

contract TestValidC {
    receive() {
        // Valid use of initOf with contract parameters (no explicit init function)
        let s = initOf C(123);
        // Valid use of codeOf with contract name
        let code = codeOf C;
    }
}
