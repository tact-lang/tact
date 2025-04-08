struct NestedOptWrap {
    optInt: Int?;
    optStr: String?;
}

contract Test {
    f1: NestedOptWrap?;
    f2: NestedOptWrap?;
    init() {
        self.f1 = null;
        self.f2 = NestedOptWrap{ optInt: null, optStr: null };
    }
}