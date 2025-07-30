struct MixOpt {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract MixOptNested {
    f: MixOpt;

    init() {
        self.f = MixOpt{
            a: 1,
            b: null,
            c: "hi",
            d: null
        };
    }
}
