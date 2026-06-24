struct ComplexMix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as int64;
    f: Int? as int64;
    g: Nested;
    h: Nested?;
}

struct Nested {
    x: Int;
    y: Bool?;
}

contract ComplexMixContract {
    data: ComplexMix;

    init() {
        self.data = ComplexMix{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 123456789,
            f: null,
            g: Nested{ x:42, y:null },
            h: null,
        };
    }

    receive() {}
}