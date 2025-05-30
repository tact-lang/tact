contract TestChainCall {
    receive() {
        let s: String = (84 - 42).toString();
        let s2: Cell = s.asComment();
    }
}
