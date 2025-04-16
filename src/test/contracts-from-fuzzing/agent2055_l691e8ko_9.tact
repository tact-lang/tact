struct InnerMost {
    m: Int;
}

struct Middle {
    inner1: InnerMost;
    inner2: InnerMost;
}

contract RepeatedStructs {
    s1: Middle;
    s2: Middle;

    init() {
        self.s1 = Middle { inner1: InnerMost{m:1}, inner2:InnerMost{m:2} };
        self.s2 = Middle { inner1: InnerMost{m:3}, inner2:InnerMost{m:4} };
    }
}
