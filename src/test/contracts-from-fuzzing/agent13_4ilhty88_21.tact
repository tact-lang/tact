contract TestExprStmt {
    receive() {
        2 + 2; // expression statement with no side effect
        dump(5);
    }
}
