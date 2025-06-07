struct InnerDeep {
    foo: Int;
    bar: Bool;
}

struct MiddleDeep {
    nestedInner: InnerDeep;
    note: String;
}

struct OuterDeep {
    nestedMiddle: MiddleDeep;
    tag: String;
    maybeVal: Int?;
}

contract DeepThreeLevel {
    payload: OuterDeep;

    init() {
        self.payload = OuterDeep{
            nestedMiddle: MiddleDeep{
                nestedInner: InnerDeep{ foo: 9, bar: false },
                note: "deep"
            },
            tag: "outer",
            maybeVal: null
        };
    }
}