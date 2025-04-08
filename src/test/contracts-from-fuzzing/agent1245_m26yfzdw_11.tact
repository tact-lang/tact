struct OptionDeep {
    nested: InnerOption?;
}

struct InnerOption {
    foo: Int?;
    bar: Bool?;
}

contract OptionalChain {
    v: OptionDeep;

    init() {
        self.v = OptionDeep{
            nested: InnerOption{
                foo: null,
                bar: true,
            },
        };
    }
}
