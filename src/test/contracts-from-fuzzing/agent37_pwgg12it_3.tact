contract TestInvalidIf {
    receive() {
        // Missing parentheses around condition
        if true { dump(42); }
    }
}
