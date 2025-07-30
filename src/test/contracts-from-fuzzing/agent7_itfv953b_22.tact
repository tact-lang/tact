struct NestedWithOptionalStruct {
    field: Int;
    opt: Bool?;
}

contract OptionalStruct {
    x: NestedWithOptionalStruct;

    init() {
        self.x = NestedWithOptionalStruct{ field: 55, opt: null };
    }
}