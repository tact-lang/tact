contract TestBlock {
    receive() {
        { // block with optional semicolon omitted in last statement
            let a: Int = 10;
            dump(a)
        }
    }
}
