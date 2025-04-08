struct Combo {
    a: Int?;
    b: String;
    c: Bool?;
    d: Int;
    e: Bool;
}

contract MixedPersist {
    content: Combo;

    init() {
        self.content = Combo{
            a: null,
            b: "hi",
            c: null,
            d: 777,
            e: true
        };
    }
}