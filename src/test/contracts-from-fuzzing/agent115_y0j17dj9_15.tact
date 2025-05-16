struct DeepNestOptional {
    innerOpt: Int?;
}

struct OuterWrap {
    wrap: DeepNestOptional;
}

contract OptionalDeep {
    stored: OuterWrap;

    init() {
        self.stored = OuterWrap{
            wrap: DeepNestOptional{ innerOpt: null }
        };
    }
}