contract MapLiteralCell {
    get fun cell(): map<Int as uint4, Cell> {
        return map<Int as uint4, Cell> {
            1: emptyCell(),
            2: beginCell().storeUint(1, 1).endCell(),
        };
    }
}
