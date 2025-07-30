struct AltOpt {
    a: Int?;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int?;
}

contract AltOptFields {
    s: AltOpt;

    init() {
        self.s = AltOpt{
            a: null,
            b: true,
            c: null,
            d: false,
            e: 99
        };
    }
}