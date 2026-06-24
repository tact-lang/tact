struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Int?;
}

contract MixedOptReq {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: null,
        };
    }
}