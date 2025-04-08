struct SubNestedOpt {
    foo: Int?;
}

struct NestedOpt {
    bar: SubNestedOpt?;
}

contract DeepOptionalStructs {
    baz: NestedOpt?;

    init() {
        self.baz = null;
    }
}