contract TestContract {
    numBig: Int; // 257 bits signed default
    numSmall: Int as uint32; // small serialized
    flag: Bool;
    optStr: String?;
    txt: String;
    cell1: Cell;

    init() {
        self.numBig = 123456789012345678901234567890;
        self.numSmall = 42;
        self.flag = true;
        self.optStr = null;
        self.txt = "The quick brown fox";
        self.cell1 = emptyCell();
    }
}
