struct InnerMost {
    m: Int;
}

struct Inner {
    n: Bool;
    innermost: InnerMost;
}

struct Outer {
    o: String;
    inner: Inner;
}

contract ComplexNested {
    s: Outer;

    init() {
        self.s = Outer { o: "ok", inner: Inner { n:true, innermost: InnerMost { m: 42 } } };
    }

    receive() {}
}