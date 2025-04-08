struct OptionalNest {
    value: Int?;
    nested: NestedOptional?;
}

struct NestedOptional {
    flag: Bool?;
    text: String?;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            value: null,
            nested: NestedOptional{
                flag: true,
                text: null,
            }
        };
    }
}
