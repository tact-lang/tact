struct Mix {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: Int?;
}

contract MixedFields {
    state: Mix;

    init() {
        self.state = Mix{
            a: 1,
            b: false,
            c: null,
            d: "hi",
            e: null
        };
    }
}
