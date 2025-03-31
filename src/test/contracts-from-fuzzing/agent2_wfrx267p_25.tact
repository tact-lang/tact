contract Test {
    receive() {
        // Test the asComment functionality and beginComment builder
        let s: String = "Test comment";

        // Convert the string to a Cell via asComment (which prefixes with four null bytes)
        let cell1: Cell = s.asComment();

        // Alternatively, build a comment using beginComment()
        let builder: StringBuilder = beginComment();
        builder.append(s);
        let cell2: Cell = builder.toCell();

        // Compare the two resulting cells
        if (cell1 != cell2) {
            // Instead of calling hashData() on Cell (which is not allowed),
            // convert the cells to slices and read a small number of bits for a dummy computation.
            let dummy: Int = cell1.asSlice().loadUint(16) + cell2.asSlice().loadUint(16);
        }
    }
}
