struct Wrapped {
    innerVal: Int?;
    s: String;
}

struct InnerWrap {
    wrap: Wrapped;
    s: String;
}

contract NullableDeep {
    state: InnerWrap?;
    init() {
        self.state = InnerWrap{
            wrap: Wrapped{
                innerVal: null,
                s: "inside",
            },
            s: "outer",
        };
    }
}
