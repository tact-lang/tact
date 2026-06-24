struct InnerNested {
    a: Int;
    b: Int?;
    s: String;
}

struct MidNested {
    inest: InnerNested;
    b: Bool;
}

contract OptionalAndNested {
    m: MidNested?;

    init() {
        self.m = MidNested {
            inest: InnerNested { a: 1, b: null, s: "str" },
            b: true
        };
    }
}