contract PersistentSlice {
    s: Slice;
    init() {
        self.s = beginCell().endCell().beginParse();
    }
}