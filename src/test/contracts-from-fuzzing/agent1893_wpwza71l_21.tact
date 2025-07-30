struct Crazy {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
    f: String?;
}

contract MixedOptionals {
    crazy: Crazy;

    init() {
        self.crazy = Crazy{
            a: 1,
            b: null,
            c: "hi",
            d: false,
            e: null,
            f: null
        };
    }
}