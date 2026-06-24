contract TestExpressionStatement {
    receive() {
        // Expression statement: legal even if it results in a discarded value
        2 + 2;
    }
}
