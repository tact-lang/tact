contract TypesTest {
    aa: Address;
    bb: Bool;
    cc: String;
    dd: Cell;
    ee: Slice;
    ff: Builder;

    init() {
        self.aa = myAddress();
        self.bb = true;
        self.cc = "hai";
        self.dd = emptyCell();
        self.ee = emptyCell().asSlice();
        self.ff = beginCell();
    }
}