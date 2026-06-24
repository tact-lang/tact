contract TestCellValue {
    get fun test() : Int {
        let m: map<Int, Cell> = emptyMap();
        let cell1: Cell = emptyCell();
        m.set(10, cell1);
        return m.get(10) != null ? 1 : 0;
    }
}
