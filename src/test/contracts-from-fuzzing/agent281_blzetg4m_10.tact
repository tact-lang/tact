struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Inner;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract NestedOptionComplex {
    val: Complex;

    init() {
        self.val = Complex{
            a: 1,
            b: false,
            c: null,
            d: Inner{ x:2, y: null }
        };
    }
}