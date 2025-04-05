contract TestTernaryValid {
    receive() {
        // Valid nested ternary: must use parentheses for consequence case
        dump(false ? 1 : (false ? 2 : 3)); // expected to dump 3
    }
}
