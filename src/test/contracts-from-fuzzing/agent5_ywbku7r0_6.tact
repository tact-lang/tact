contract Test {
    receive() {
        // Block statement with one statement (semicolon present)
        { let a: Int = 10; dump(a); }
    }
}
