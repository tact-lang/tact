contract B(x: Int) {
    // Contract with parameter
    receive() {}
}

contract TestB {
    receive() {
        let init_state = initOf B(100);
        let code_cell = codeOf B;
    }
}
