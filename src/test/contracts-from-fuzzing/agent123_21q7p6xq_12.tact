struct OptionalNested {
    innerOpt: Int?;
    sOpt: String?;
    aOpt: Address?;
}

struct OptionalContainer {
    nested: OptionalNested?;
    flag: Bool;
}

contract TestContract {
    field: OptionalContainer;

    init() {
        self.field = OptionalContainer{
            nested: OptionalNested{
                innerOpt: 7,
                sOpt: "hi",
                aOpt: null
            },
            flag: true
        };
    }
}