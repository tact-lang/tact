contract TestBlock {
    receive() {
        { let a: Int = 42; dump(a); }
        { dump("Block statement without semicolon") }
    }
}
