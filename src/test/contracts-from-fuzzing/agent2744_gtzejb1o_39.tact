struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract MixedOpts {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: "hi",
            d: null
        };
    }
}
