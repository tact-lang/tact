contract Simple {
    // No state variables, implicit empty init
}

contract Test {
    receive() {
        // Using initOf with an empty init call
        let init_state = initOf Simple();
        // Using codeOf to get the code cell of Simple
        let code_cell = codeOf Simple;
    }
}