struct MixedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    m: MixedOpt;
    init() {
        self.m = MixedOpt{
            a: 10,
            b: null,
            c: "hello",
            d: null,
            e: true,
            f: null
        };
    }
}