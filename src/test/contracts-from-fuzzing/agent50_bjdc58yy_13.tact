contract TestChaining {
    receive() {
        // Chaining extension function calls on an integer literal.
        // First, convert 42 to a string, then treat the result as a comment.
        // According to documentation, both toString() and asComment() are valid extensions on their types.
        dump(42.toString().asComment());
    }
}
