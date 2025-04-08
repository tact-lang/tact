struct NestedOpt {
    inner: Int?;
    flag: Bool;
}

contract Opts {
    f1: NestedOpt?;
    f2: NestedOpt?;
    f3: NestedOpt?;

    init() {
        self.f1 = null;
        self.f2 = NestedOpt{ inner: null, flag: true };
        self.f3 = null;
    }
}
