contract D(x: Int) {
    // Contract with parameters (no explicit init allowed)
    receive() {}
}

contract TestCodeOfParameterized {
    receive() {
        // Valid usage: obtaining the code cell of a parameterized contract
        let c = codeOf D;
    }
}
