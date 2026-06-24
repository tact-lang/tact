struct NestedOptionalStruct {
    f1: Int?;
    f2: Bool?;
}

struct Wrap {
    nested: NestedOptionalStruct?;
}

contract OptionalNestedContract {
    w: Wrap;

    init() {
        self.w = Wrap{
            nested: null,
        };
    }
}