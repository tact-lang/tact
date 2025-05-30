struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract MixedTypes {
    data: Mix;

    init() {
        self.data = Mix{
            a: 5,
            b: null,
            c: true,
            d: null,
            e: "ok",
            f: null,
            g: myAddress(),
            h: null,
        };
    }
}