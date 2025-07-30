struct Mix {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: String;
    f: String?;
}

contract MixedFields {
    storage: Mix;

    init() {
        self.storage = Mix{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: "hi",
            f: "optional",
        };
    }

    receive() {}
}