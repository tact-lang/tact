struct InnerMost {
    v: Int;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    m: Middle;
}

contract DeepStructs {
    nested: Outer;

    init() {
        self.nested = Outer{ m: Middle{ im: InnerMost{v:42} } };
    }
}