struct MixOpt {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    x: MixOpt;

    init() {
        self.x = MixOpt{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "ok",
            f: null
        };
    }
}