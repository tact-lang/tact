struct Interleave {
    a: Int;
    b: Bool?;
    c: InnerNest;
    d: String?;
    e: Int as uint32;
    f: Bool;
}

struct InnerNest {
    x: Bool?;
    y: String;
}

contract InterleaveFields {
    data: Interleave;

    init() {
        self.data = Interleave{
            a: 99,
            b: true,
            c: InnerNest{
                x: null,
                y: "xyz"
            },
            d: null,
            e: 12345,
            f: false
        };
    }
}