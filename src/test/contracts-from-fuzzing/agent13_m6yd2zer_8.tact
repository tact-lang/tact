contract TestBlock {
    receive() {
        { let x: Int = 5; dump(x) } // block with omitted final semicolon
    }
}
