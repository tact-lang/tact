struct InnerMost {
    x: Int;
}
struct Middle {
    im: InnerMost;
    s: String?;
}
struct Outer {
    m: Middle;
    b: Bool;
}

contract ChainNested {
    f: Outer;

    init() {
        self.f = Outer{ m: Middle{ im: InnerMost{ x: 1 }, s: null }, b: true };
    }
}