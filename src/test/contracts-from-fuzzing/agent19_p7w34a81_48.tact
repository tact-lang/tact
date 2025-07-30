struct MixNulls {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract NullsMix {
    m: MixNulls;

    init() {
        self.m = MixNulls{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}