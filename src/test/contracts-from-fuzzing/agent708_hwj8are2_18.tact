struct InnerMost {
    a: Int;
}

struct Middle {
    b: InnerMost;
}

struct MiddleOpt {
    b: InnerMost?;
}

struct Outer {
    c: Middle;
    d: MiddleOpt;
}

contract ComplexNestOpt {
    data: Outer;

    init() {
        self.data = Outer{
            c: Middle{ b: InnerMost{ a:1 } },
            d: MiddleOpt{ b: null }
        };
    }
}