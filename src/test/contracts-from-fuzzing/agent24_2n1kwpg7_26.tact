contract TestCellHashEquality {
    receive() {
        // Create two identical cells and compare their hashes
        let a = beginCell().storeUint(123, 8).endCell();
        let b = beginCell().storeUint(123, 8).endCell();
        let ah = a.hash();
        let bh = b.hash();
        let eq: Bool = ah == bh; // expected true
    }
}
