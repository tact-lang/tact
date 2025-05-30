contract TestTernaryNestingValid {
    receive() {
        // Valid nested ternary: alternative part nests without extra parentheses
        // According to specification, this should evaluate as 3
        dump(false ? 1 : false ? 2 : 3);
    }
}
