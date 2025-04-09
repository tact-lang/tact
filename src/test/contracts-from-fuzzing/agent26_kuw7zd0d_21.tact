contract TestLongStringCell {
    receive() {
        // Testing conversion of a longer string literal to a cell via StringBuilder
        let s: String = "This is a relatively long string to test conversion to Cell.";
        let sb: StringBuilder = beginString();
        sb.append(s);
        let cell: Cell = sb.toCell();
    }
}
