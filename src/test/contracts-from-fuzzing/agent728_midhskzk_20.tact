struct MixOpt {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
    f: String;
}

contract MixOrder {
    state: MixOpt;

    init() {
        self.state = MixOpt{
            a: null,
            b: true,
            c: null,
            d: 123,
            e: null,
            f: "done"
        };
    }
}