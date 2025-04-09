contract TestCellMap {
    m: map<Int, Cell>;

    receive() {
        self.m = emptyMap();
        let c: Cell = beginCell().storeUint(100, 32).endCell();
        self.m.set(1, c);
        let got: Cell? = self.m.get(1);
        let s: Slice = got!!.beginParse();
        let n: Int = s.loadUint(32);
        dump(n); // Expected output: 100
    }
}
