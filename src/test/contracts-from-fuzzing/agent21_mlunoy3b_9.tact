contract TestChain {
    receive() {
        // Testing function call chaining and inline arguments
        // Correct chaining: toString() returns String, and asComment() converts it into a Cell
        let result: Cell = 42.toString().asComment();
        return;
    }
}
