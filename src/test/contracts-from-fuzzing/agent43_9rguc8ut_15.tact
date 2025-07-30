contract TestChain {
    receive() {
        // Chain: Convert integer to String then convert that to a Cell via asComment()
        let cell: Cell = 42.toString().asComment();
        dump(cell);
    }
}
