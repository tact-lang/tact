contract PrimitiveMix {
    ia: Int;
    ib: Int?;
    ba: Bool;
    bb: Bool?;
    ca: Cell;
    cb: Cell?;
    sa: Slice;
    sb: Slice?;
    aa: Address;
    ab: Address?;
    st: String;
    su: String?;

    init() {
        self.ia = 1;
        self.ib = null;
        self.ba = true;
        self.bb = null;
        self.ca = emptyCell();
        self.cb = null;
        self.sa = emptyCell().asSlice();
        self.sb = null;
        self.aa = myAddress();
        self.ab = null;
        self.st = "abc";
        self.su = null;
    }

    receive() {
        let _ = self.ia + 1;
    }
}