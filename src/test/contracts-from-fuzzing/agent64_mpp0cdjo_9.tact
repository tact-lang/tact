contract TestBlock {
    receive() {
        { let a: Int = 1; dump(a) }
    }
}
