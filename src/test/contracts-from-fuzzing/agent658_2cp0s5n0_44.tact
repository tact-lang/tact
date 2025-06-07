struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract MixedOpt {
    field: Mix;

    init() {
        self.field = Mix{
            a: 10,
            b: null,
            c: "x",
            d: null
        };
    }
}