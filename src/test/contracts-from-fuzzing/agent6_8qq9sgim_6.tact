struct OptionalDeep {
    s: String?;
    nested: InnerOptional?;
}

struct InnerOptional {
    flag: Bool?;
}

contract OptionalNest {
    complexField: OptionalDeep;

    init() {
        self.complexField = OptionalDeep{
            s: null,
            nested: InnerOptional{flag: true}
        };
    }
}