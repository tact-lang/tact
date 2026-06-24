struct NestedOptionals {
    a: Bool?;
    b: String?;
    c: Int?;
    d: Inner?
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptNested {
    f: NestedOptionals;

    init() {
        self.f = NestedOptionals{
            a: true,
            b: null,
            c: 999,
            d: Inner{ x: 1, y: false }
        };
    }
}
