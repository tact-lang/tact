contract TestChain {
    receive() {
        // Chaining function calls on a literal: first toString() converts 42 to a string, then asComment() converts to a cell
        let result: Cell = 42.toString().asComment();
    }
}
