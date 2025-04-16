struct NestedOptional {
    first: InnerOptional?;
}

struct InnerOptional {
    value: Int?;
}

contract OptionalDeep {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            first: InnerOptional{ value: null }
        };
    }
}