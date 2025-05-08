struct MixOpt {
    a: String?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: String?;
    f: Int?;
    g: Bool?;
    h: Address?;
}

contract LotsMixOpt {
    data: MixOpt;

    init() {
        self.data = MixOpt{
            a: null, b: 11, c: true, d: null,
            e: "x", f: null, g: null, h: myAddress()
        };
    }
}