contract Test {
    // Block statement: grouping of statements in braces
    receive() {
        { dump(2); }
        dump(3)
    }
}
