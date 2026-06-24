struct MidOptional {
    a: Int;
    b: Int?;
}

struct OuterWrap {
    c: MidOptional?;
    d: Bool;
}

contract OptionalsMid {
    store: OuterWrap;

    init() {
        self.store = OuterWrap{
            c: MidOptional{ a: 2, b: null },
            d: true
        };
    }
}
