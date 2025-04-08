struct OptionalNestedDeep {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    s1: String?;
}

struct OptionalWrap {
    a: OptionalNestedDeep?;
    b: String?;
}

contract OptionalStructField {
    d: OptionalWrap;

    init() {
        self.d = OptionalWrap{
            a: OptionalNestedDeep{
                i1: 1,
                i2: null,
                b1: null,
                s1: "y"
            },
            b: null
        };
    }
}
