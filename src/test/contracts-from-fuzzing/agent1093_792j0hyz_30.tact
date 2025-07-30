struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixEmbed {
    x: Mix;

    init() {
        self.x = Mix{
            a: 1,
            b: false,
            c: "abc",
            d: null,
            e: null,
            f: null
        };
    }
}