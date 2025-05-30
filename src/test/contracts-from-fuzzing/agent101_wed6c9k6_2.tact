struct OptionalDeep {
    nestedOpt: InnerOptional?;
}

struct InnerOptional {
    field: Int;
}

contract TestOptionalNested {
    state: OptionalDeep;

    init() {
        self.state = OptionalDeep{
            nestedOpt: InnerOptional{
                field: 777,
            },
        };
    }
}