contract TestExpression {
    receive() {
        // Expression statement with no side effect (result is discarded)
        1 + 1;
        dump(2);
    }
}
