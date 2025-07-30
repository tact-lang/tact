struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract MixOptionalRegular {
    s: Mix;

    init() {
        self.s = Mix{
            a: 4,
            b: null,
            c: "x",
            d: 10
        };
    }
}
