struct OptionalStruct {
    foo: Int?;
    bar: Int?;
}

struct Container {
    nested: OptionalStruct?;
}

contract NestedOptional {
    val: Container;

    init() {
        self.val = Container{ nested: null };
    }
}