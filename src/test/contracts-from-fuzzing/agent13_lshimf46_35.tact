contract TestCellOverflow {
    receive() {
        // This test attempts to trigger a cell overflow by storing more than 4 references in a single cell.
        // A cell can store at most 4 references. The 5th call to storeRef() should throw an exception with exit code 8.
        let b: Builder = beginCell();
        let b1: Builder = b.storeRef(beginCell().endCell());
        let b2: Builder = b1.storeRef(beginCell().endCell());
        let b3: Builder = b2.storeRef(beginCell().endCell());
        let b4: Builder = b3.storeRef(beginCell().endCell());
        try {
            // This should cause a cell overflow
            let b5: Builder = b4.storeRef(beginCell().endCell());
            dump(0); // Not expected to be reached
        } catch (err) {
            dump(err); // Expected to dump an error code for cell overflow
        }
    }
}
