struct NestedOptionals {
    f1: Int?;
    nested: InnerOptionalStruct?;
}

struct InnerOptionalStruct {
    flag: Bool?;
    message: String?;
}

contract OptionalNest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            f1: null,
            nested: null
        };
    }
}