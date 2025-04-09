struct OptionalDeep {
    innerOpt: Int?;
    nestedOpt: Bool?;
}

struct HasOptional {
    someInt: Int;
    wrapped: OptionalDeep?;
}

contract TestContract {
    ho: HasOptional;

    init() {
        self.ho = HasOptional{
            someInt: 10,
            wrapped: OptionalDeep{
                innerOpt: null,
                nestedOpt: false
            }
        };
    }
}