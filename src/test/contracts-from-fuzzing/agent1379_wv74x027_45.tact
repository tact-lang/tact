struct LongNested {
    a: Int;
    b: Nested;
    c: Bool;
    d: String;
}

struct Nested {
    x: Int;
    y: String;
    z: Bool;
}

contract ComplexNest {
    s: LongNested;

    init() {
        self.s = LongNested{
            a: 1,
            b: Nested{
                x: 2,
                y: "str",
                z: false,
            },
            c: true,
            d: "end",
        };
    }
}
