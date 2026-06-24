contract Test12 {
    big1: Cell;
    big2: Cell;
    big3: Cell;
    big4: Cell;
    big5: Cell;
    big6: Cell;
    big7: Cell;
    big8: Cell;
    big9: Cell;
    big10: Cell;
    init() {
        let c = beginCell().storeUint(1, 1).endCell();
        self.big1 = c; self.big2 = c; self.big3 = c; self.big4 = c; self.big5 = c;
        self.big6 = c; self.big7 = c; self.big8 = c; self.big9 = c; self.big10 = c;
    }
}
