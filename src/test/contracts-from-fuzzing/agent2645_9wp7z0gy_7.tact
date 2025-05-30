struct Complex {
    i: Int;
    s: String;
    b: Bool;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract MixedTypes {
    field: Complex;

    init() {
        self.field = Complex{
            i: -42,
            s: "test",
            b: true,
            optI: null,
            optS: "abc",
            optB: false,
        };
    }
}
