struct MixOpt {
    a: Int?;
    b: Int;
    c: Bool?;
    d: String;
    e: String?;
    f: Bool;
}

contract TestContract {
    mixed: MixOpt = MixOpt{
        a: null,
        b: 1,
        c: null,
        d: "",
        e: null,
        f: false
    };

    init() {
        self.mixed = MixOpt{
            a: 10,
            b: 2,
            c: true,
            d: "x",
            e: "opt",
            f: true
        };
    }
}