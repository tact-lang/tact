struct Inner {
    a: Int;
    optB: Bool?;
}

struct RichStruct {
    first: Inner;
    optInner: Inner?;
    optionalInt: Int?;
    optBool: Bool?;
}

contract DiverseOptionals {
    field: RichStruct;

    init() {
        self.field = RichStruct{
            first: Inner{ a: 1, optB: null },
            optInner: null,
            optionalInt: null,
            optBool: null
        };
    }
}