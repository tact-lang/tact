struct Complex {
    i1: Int = 1;
    b1: Bool = true;
    s1: String = "hello";
    i2: Int?;
    s2: String?;
    nested1: Nested;
    nestedOpt: Nested?;
}

struct Nested {
    innerInt: Int;
    innerBool: Bool;
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            i1: 42,
            b1: false,
            s1: "ok",
            i2: 100,
            s2: "bye",
            nested1: Nested{ innerInt: 7, innerBool: true },
            nestedOpt: null
        };
    }

    receive() {}
}
