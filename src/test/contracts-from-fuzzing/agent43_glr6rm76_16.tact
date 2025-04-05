contract TestExprStatement {
    receive() {
        2 + 2; // expression statement, result discarded
        dump(42);
    }
}
