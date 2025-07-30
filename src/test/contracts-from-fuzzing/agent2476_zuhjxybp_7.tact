struct SubInner {
    f: Int;
}

struct Inner {
    a: Int;
    b: Bool;
    c: SubInner;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract ComplexLayout {
    s: Outer;
    init() {
        self.s = Outer {
            x: 5,
            y: Inner {
                a: 1,
                b: true,
                c: SubInner { f: 9 },
            },
        };
    }
}