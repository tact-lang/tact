struct Complex {
    a: Int;
    b: Sub;
}

struct Sub {
    c: Bool;
    d: Int?;
    e: Deeper;
}

struct Deeper {
    f: Int;
    g: Bool?;
    h: String;
}

contract NestedOptionMix {
    field: Complex;
    init() {
        self.field = Complex{
            a: 1,
            b: Sub {
                c: true,
                d: null,
                e: Deeper {
                    f: 9,
                    g: null,
                    h: "hello"
                }
            }
        };
    }
}