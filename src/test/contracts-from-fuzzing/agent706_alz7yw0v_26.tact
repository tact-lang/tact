struct NestedOptionals {
    nested1: MultiOption?;
    nested2: MultiOption?;
}

struct MultiOption {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    nestedOpt: NestedOptionals;

    init() {
        self.nestedOpt = NestedOptionals{
            nested1: null,
            nested2: MultiOption{
                optInt: 1,
                optBool: null,
            },
        };
    }
}