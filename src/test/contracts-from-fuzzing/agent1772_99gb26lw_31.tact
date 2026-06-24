contract Test31 {
    addr: Address;
    str: String;
    flag: Bool;
    slc: Slice;
    cl: Cell;
    num: Int;
    numn: Int?;
    sn: String?;
    bl: Bool?;

    init() {
        self.addr = myAddress();
        self.str = "zzz";
        self.flag = true;
        self.slc = emptyCell().asSlice();
        self.cl = emptyCell();
        self.num = 17;
        self.numn = null;
        self.sn = null;
        self.bl = null;
    }
}