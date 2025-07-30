contract TestBlock {
    receive() {
        { // block with missing semicolon on last statement
            let x: Int = 42;
            dump(x)
        }
    }
}
