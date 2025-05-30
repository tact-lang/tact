struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
}

contract MixedVarieties {
    field: Combo;

    init() {
        self.field = Combo{
            a: 42,
            b: null,
            c: "xyz",
            d: null
        };
    }
}