contract D(x: Int, y: Int) {
    receive() {}
}

contract TestD {
    receive() {
        // trailing comma in parameters is allowed
        let state = initOf D(10, 20, );
        let code_cell = codeOf D;
    }
}
