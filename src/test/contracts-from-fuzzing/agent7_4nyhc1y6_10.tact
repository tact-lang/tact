contract TestExprStmt {
    receive() {
        // Expression statement: call dump which returns void, result is discarded
        dump(2 + 2);
    }
}
