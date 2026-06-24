struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedTypes {
    m: Mix;

    init() {
        self.m = Mix{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: "opt"
        };
    }
}