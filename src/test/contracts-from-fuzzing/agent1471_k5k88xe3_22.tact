struct OptionAndNonopt {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedPersist {
    storage: OptionAndNonopt;

    init() {
        self.storage = OptionAndNonopt{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hello",
            f: null,
        };
    }
}
