struct OptionalDeep {
    level1: Int?;
    nested: NestedOpt?;
}

struct NestedOpt {
    someField: Bool;
}

contract OptionalNest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            level1: null,
            nested: null
        };
    }
}