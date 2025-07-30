contract Test {
    receive() {
        { let a: Int = 1; dump(a) }
        { let a: Int = 2; dump(a); }
    }
}
