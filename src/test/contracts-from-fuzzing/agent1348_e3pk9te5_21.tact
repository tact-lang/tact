struct Ones {
    v: Int;
}

contract MixTopLevel {
    intOpt: Int?;
    boolOpt: Bool?;
    sliceOpt: Slice?;
    inner: Ones?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.sliceOpt = null;
        self.inner = Ones{v:123};
    }
}