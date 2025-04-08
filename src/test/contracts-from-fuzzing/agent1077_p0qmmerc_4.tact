struct OptionalNested {
    optInt: Int?;
    optBool: Bool?;
    nestedOpt: NestedOptional?;
}

struct NestedOptional {
    x: Int;
    y: Bool?;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            optInt: null,
            optBool: true,
            nestedOpt: NestedOptional{
                x: 5,
                y: null
            }
        };
    }
}