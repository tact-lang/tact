struct Inner {
    val: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedManyOptionals {
    outerOpt: Outer?;
    intOpt: Int?;
    strOpt: String?;
    sliceOpt: Slice?;
    addrOpt: Address?;
    boolOpt: Bool?;

    init() {
        self.outerOpt = null;
        self.intOpt = null;
        self.strOpt = null;
        self.sliceOpt = null;
        self.addrOpt = null;
        self.boolOpt = null;
    }
}