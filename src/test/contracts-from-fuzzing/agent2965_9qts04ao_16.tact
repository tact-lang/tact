struct Complex {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int?;
    b2: Bool?;
    s2: String?;
}

contract TestContract {
    field: Complex;

    init() {
        self.field = Complex{
            i1: 5,
            b1: true,
            s1: "abc",
            i2: null,
            b2: null,
            s2: null
        };
    }
}
