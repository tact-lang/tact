contract SimpleContract {
    receive() {}
}

contract Test {
    receive() {
        // Using initOf with parentheses as there are no init parameters
        let init_c = initOf SimpleContract();
        // Using codeOf without parentheses as per documentation
        let code_c = codeOf SimpleContract;
    }
}
