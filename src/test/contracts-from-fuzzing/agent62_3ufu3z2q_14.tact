contract Test {
    receive() {
        // Test: using asComment on a string and compare with building comment via StringBuilder
        let s: String = "When life gives you lemons, call them 'yellow oranges'!";
        let cell1: Cell = s.asComment();
        let builder: StringBuilder = beginComment();
        builder.append(s);
        let cell2: Cell = builder.toCell();
        if (cell1 != cell2) {
            throw(1);
        }
    }
}
