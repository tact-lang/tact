struct InnerMost {
    x: Int;
    y: Int;
}

struct Middle {
    a: Int;
    inner: InnerMost;
}

struct OuterMost {
    b: Int;
    mid: Middle;
}

contract ThreeLevelNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            b:5,
            mid: Middle{ a:3, inner: InnerMost{ x:1, y:2 } }
        };
    }
}