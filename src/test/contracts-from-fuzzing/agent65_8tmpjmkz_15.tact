struct MixOpt {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "default";
}

contract ComboOptional {
    combined: MixOpt;

    init() {
        self.combined = MixOpt{
            a: null,
            b: 42,
            c: null,
            d: true,
            e: null,
            f: "set"
        };
    }
}