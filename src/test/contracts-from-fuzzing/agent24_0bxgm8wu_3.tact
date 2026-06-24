contract TestBlock {
    receive() {
        { // block statement with optional semicolon on final statement
            let y: Int = 2 + 2;
            dump(y)
        }
    }
}
