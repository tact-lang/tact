struct NestedOptional {
    innerValue: Int?;
}

struct DoubleOptional {
    nested: NestedOptional?;
}

contract NestedOptionals {
    data: DoubleOptional;

    init() {
        self.data = DoubleOptional{
            nested: null
        };
    }
}