struct Info {
    flag: Bool;
    comment: String;
    sliceVal: Slice;
    cellVal: Cell;
    addr: Address;
    strOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addrOpt: Address?;
    intOpt: Int?;
    boolOpt: Bool?;
}

contract EverythingOpt {
    i: Info?;

    init() {
        self.i = null;
    }
}
