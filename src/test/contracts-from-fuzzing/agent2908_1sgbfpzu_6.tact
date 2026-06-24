contract OptionalPrimitive {
    val: Int?;
    flag: Bool?;
    addr: Address?;
    sliceVal: Slice?;
    cellVal: Cell?;

    init() {
        self.val = null;
        self.flag = null;
        self.addr = null;
        self.sliceVal = null;
        self.cellVal = null;
    }
}