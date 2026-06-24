contract Iterated {
    cells: map<Int, Cell>;

    init() {
        self.cells = emptyMap();
        self.cells.set(1, beginCell().storeUint(100, 16).endCell());
        self.cells.set(2, beginCell().storeUint(200, 16).endCell());
    }

    get fun iterateSum(): Int {
        let sum: Int = 0;
        foreach (key, value in self.cells) {
            let s: Slice = value.beginParse();
            sum += s.loadUint(16);
        }
        return sum;
    }
}
