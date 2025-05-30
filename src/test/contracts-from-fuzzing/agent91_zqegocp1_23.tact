struct ComplexOption {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    d: Int;
    e: String?;
}

contract Test {
    data: ComplexOption;

    init() {
        self.data = ComplexOption{
            a: null,
            b: null,
            c: null,
        };
    }
}