struct OptionalComplex {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{
            a: null,
            b: null,
            c: null,
            d: Inner{
                x: 42,
                y: null
            }
        };
    }
}