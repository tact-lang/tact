contract TestExpression {
    receive() {
        // Expression statement: evaluates and discards the result of a side-effect function
        dump(2 + 2);
    }
}
