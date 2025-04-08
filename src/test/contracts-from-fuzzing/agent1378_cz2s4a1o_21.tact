struct InnerMost {
    x: Int;
}
struct Mid {
    i: InnerMost;
}
struct Middle {
    m: Mid;
}
struct OuterMost {
    m2: Middle;
}

contract DeepField {
    f: OuterMost = OuterMost{m2:Middle{m:Mid{i:InnerMost{x:3}}}};
    init() {
        self.f = OuterMost{m2:Middle{m:Mid{i:InnerMost{x:4}}}};
    }
    receive() {}
}