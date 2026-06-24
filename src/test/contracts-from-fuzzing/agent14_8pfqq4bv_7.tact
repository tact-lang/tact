contract TestBlock {
    receive() {
        // A block statement with multiple statements, last semicolon omitted
        {
            let a: Int = 7;
            dump(a)
        }
    }
}
