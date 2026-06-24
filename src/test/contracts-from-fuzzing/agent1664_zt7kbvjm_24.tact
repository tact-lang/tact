struct UltraOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract UltraOptStore {
    data: UltraOpt;

    init() {
        self.data = UltraOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}