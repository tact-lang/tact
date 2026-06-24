struct ComplexNested {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: NestedInner?;
}

struct NestedInner {
    x: Int;
    y: Bool;
}

contract ComplexStructFields {
    s: ComplexNested;

    init() {
        self.s = ComplexNested{
            a: 42,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}