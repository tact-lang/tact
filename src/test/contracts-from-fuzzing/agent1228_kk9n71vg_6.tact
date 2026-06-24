contract ManyFields {
    i: Int = 0;
    j: Int = -1;
    flag: Bool = false;
    flag2: Bool = true;
    s: String = "hello";
    sOpt: String? = null;
    b: Cell;
    sl: Slice;
    addr: Address?;

    init() {
        self.b = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = null;
    }
}