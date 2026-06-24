contract TestChainedExtensionsCorrect {
    receive() {
         // Chaining extension functions: Int.toString() returns a String, and then asComment() converts it to a Cell.
         let cellRes: Cell = 42.toString().asComment();
    }
}
