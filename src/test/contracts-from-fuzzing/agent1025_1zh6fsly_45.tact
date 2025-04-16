struct NestedDefaults {
    s1: InnerD;
    s2: InnerD;
}

struct InnerD {
    x: Int = 1;
    y: Bool = false;
}

contract TestDefaults {
    n: NestedDefaults;

    init() {
        self.n = NestedDefaults{
            s1: InnerD{},
            s2: InnerD{}
        };
    }
}
