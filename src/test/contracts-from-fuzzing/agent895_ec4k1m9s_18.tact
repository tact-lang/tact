struct Alternating {
    a: Int;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool;
    f: String?;
}

contract PatternMix {
    data: Alternating;

    init() {
        self.data = Alternating{
            a: 42,
            b: true,
            c: null,
            d: 43,
            e: false,
            f: null,
        };
    }
}