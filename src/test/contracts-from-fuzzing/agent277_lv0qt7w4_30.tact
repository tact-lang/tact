struct ComplexOpt {
    a: Int?;
    b: Bool?;
    s: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    data: ComplexOpt;
    init() {
        self.data = ComplexOpt{
            a: null,
            b: true,
            s: Inner{ x: 42, y: null }
        };
    }
}