struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixedTypes {
    mix: Mix;

    init() {
        self.mix = Mix{
            a: 1,
            b: true,
            c: "str",
            d: null,
            e: null,
            f: null
        };
    }
}
