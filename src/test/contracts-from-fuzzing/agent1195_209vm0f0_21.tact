struct InnerMost {
    a: Int;
}
struct Inner {
    im: InnerMost;
}
struct Outer {
    i: Inner;
}
contract Nested {
    f: Outer;
    init() {
        self.f = Outer{ i: Inner{ im: InnerMost{ a: 7 } } };
    }
}
