struct Mid {
    a: Int;
    b: Bool;
}

struct Outer {
    m: Mid;
    opt: Int?;
    extra: Bool;
}

contract NestedWithOptionals {
    f: Outer;

    init() {
        self.f = Outer{
            m: Mid{ a: 5, b: false },
            opt: null,
            extra: true
        };
    }
}
