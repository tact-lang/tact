contract TestBlock {
    receive() {
        // Block with multiple statements, last semicolon omitted
        {
            let x: Int = 100;
            dump(x) // last semicolon omitted intentionally
        }
    }
}
