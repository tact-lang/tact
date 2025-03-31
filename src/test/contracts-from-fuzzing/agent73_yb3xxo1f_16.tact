contract Test {
    receive() {
        // Testing equivalence of asComment conversion methods:
        // According to docs, s.asComment() and building via beginComment() yield identical Cells.
        let s: String = "When life gives you lemons, call them 'yellow oranges'!";
        let cell1: Cell = s.asComment();
        let sb: StringBuilder = beginComment();
        sb.append(s);
        let cell2: Cell = sb.toCell();
        if (!(cell1 == cell2)) {
            throw(100); // Report error if cells are not identical
        }
    }
}
