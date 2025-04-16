struct Sub {
    a: Int? as uint8 = null;
    b: Bool? = null;
}

contract TestContract {
    x: Int;
    y: Int as uint32;
    z: Int?;
    w: Int? as uint64 = null;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    addr: Address? = null;
    cellVal: Cell? = null;
    sliceVal: Slice? = null;
    nested: Sub;
    init() {
        self.x = 1;
        self.y = 2;
        self.z = null;
        self.w = null;
        self.b1 = true;
        self.b2 = null;
        self.s1 = "s";
        self.s2 = null;
        self.addr = null;
        self.cellVal = null;
        self.sliceVal = null;
        self.nested = Sub{};
    }
}