struct SubInner {
    si: Int;
}
struct Inner {
    sub: SubInner;
    opt: Int?;
}
struct Outer {
    foo: Bool;
    inner: Inner;
}

contract ComplexFields {
    f: Outer;

    init() {
        self.f = Outer{
            foo: true,
            inner: Inner{
                sub: SubInner{ si: 42 },
                opt: null
            }
        };
    }
}
