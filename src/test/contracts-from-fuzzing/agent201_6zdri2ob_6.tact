struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

struct Complex {
    x: Int;
    y: NestedOpt?;
}

contract OptionalNestedStructField {
    data: Complex;

    init() {
        self.data = Complex{
            x: 5,
            y: null
        };
    }
}
