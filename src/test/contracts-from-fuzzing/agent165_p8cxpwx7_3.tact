contract B(x: Int, y: Int) {
    // Contract with parameters
    receive() {}
}

contract Test2 {
    receive() {
        // Valid usage: supplying correct parameters for a contract with parameters
        let b_init = initOf B(10, 20);
        // Valid usage: retrieving only code (parameters not used)
        let b_code = codeOf B;
    }
}
