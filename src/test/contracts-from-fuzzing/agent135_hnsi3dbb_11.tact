struct InnerMost {
    x: String?;
}
struct Inner {
    im: InnerMost;
}
struct Middle {
    inr: Inner;
}
struct Outer {
    mdl: Middle;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{ mdl: Middle{ inr: Inner{ im: InnerMost{ x: null } } } };
    }
}