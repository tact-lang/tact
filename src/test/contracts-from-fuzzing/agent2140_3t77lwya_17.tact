struct Rec {
    a: Int;
    b: Int?;
    c: Int?;
    d: Int;
    e: Int?;
    f: Int;
}

contract OptMix {
    data: Rec;
    init() {
        self.data = Rec{
            a: 1,
            b: null,
            c: null,
            d: 4,
            e: null,
            f: 6,
        };
    }
}
