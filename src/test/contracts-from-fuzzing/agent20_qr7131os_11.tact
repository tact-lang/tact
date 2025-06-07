contract TestTernaryPrecedence {
    receive() {
        // Ternary operator with nested alternatives
        dump(false ? 1 : (true ? 2 : 3)); // expecting 2
        dump(true ? 1 : false ? 2 : 3);    // expecting 1
    }
}
