contract TestContract {
    small1: Int as uint8;
    small2: Int as int16;
    small3: Int as uint4;
    def1: Int;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.small1 = 0;
        self.small2 = -123;
        self.small3 = 5;
        self.def1 = 9999999999999999;
        self.optStr = null;
        self.optCell = emptyCell();
    }
}
