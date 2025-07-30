struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String?;
}

contract MixedFields {
    f: Mix;
    init() {
        self.f = Mix{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: null
        };
    }
}