struct OptionDeep {
    inner: Int?;
}

struct NestedOptWrap {
    first: OptionDeep;
    second: OptionDeep;
}

contract MultiOptDepth {
    state: NestedOptWrap;

    init() {
        self.state = NestedOptWrap{
            first: OptionDeep{ inner: null },
            second: OptionDeep{ inner: null },
        };
    }
}
