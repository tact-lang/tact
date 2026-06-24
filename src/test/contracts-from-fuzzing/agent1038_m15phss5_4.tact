struct OptNested {
    nested: Int?;
}

struct Container {
    field: OptNested;
}

contract OptionalNestedStruct {
    data: Container = Container{ field: OptNested{ nested: null } };
    init() {}
}