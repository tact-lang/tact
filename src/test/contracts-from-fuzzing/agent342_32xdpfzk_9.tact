struct NestedOptional {
    innerOpt: Int?;
    flag: Bool;
}

struct OptionalNest {
    nest: NestedOptional?;
    comment: String;
}

contract Test8 {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            nest: NestedOptional{
                innerOpt: 42,
                flag: false,
            },
            comment: "check optionals",
        };
    }
}