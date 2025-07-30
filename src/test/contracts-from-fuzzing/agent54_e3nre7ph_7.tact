contract TestBlock1 {
    receive() {
        // Testing block statement with braces and semicolon
        { let a: Int = 7; dump(a); }
    }
}
