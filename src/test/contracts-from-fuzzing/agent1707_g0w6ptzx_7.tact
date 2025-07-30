struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Middle {
    a: InnerMost;
    b: Int;
}

struct OuterMost {
    aa: Middle;
    bb: Middle;
}

contract TestContract {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            aa: Middle{ a: InnerMost{ x: null, y: true }, b: 10 },
            bb: Middle{ a: InnerMost{ x: 42, y: false }, b: 20 }
        };
    }
}
