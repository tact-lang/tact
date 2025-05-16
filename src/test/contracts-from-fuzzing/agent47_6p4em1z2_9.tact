contract TestTernaryNestingValid {
    receive() {
        // Valid nested ternary expression: nested alternative case
        let r: Int = false ? 1 : (true ? 2 : 3);
        dump(r.toString());
    }
}
