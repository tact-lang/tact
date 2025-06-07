struct Mix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixContract {
    mix: Mix;

    init() {
        self.mix = Mix{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "str",
            f: null,
        };
    }
}