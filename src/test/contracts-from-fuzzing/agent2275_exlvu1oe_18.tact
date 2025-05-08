struct StrNest {
    inner: String;
}

struct IntNest {
    inner: Int;
}

contract TwoStructVars {
    s: StrNest;
    i: IntNest;
    init() {
        self.s = StrNest{ inner: "foo" };
        self.i = IntNest{ inner: 77 };
    }
}