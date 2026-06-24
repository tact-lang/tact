struct Complex {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: String?;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract ManyFields {
    data: Complex;

    init() {
        self.data = Complex {
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: null,
            f7: "b",
            f8: 2,
            f9: false,
            f10: "c"
        };
    }
}