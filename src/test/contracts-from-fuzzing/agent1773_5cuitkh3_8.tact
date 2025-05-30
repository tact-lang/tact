struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
}

struct OuterStruct {
    nest: NestedOptionalStruct;
    x: Int;
}

contract OptionalsMany {
    data: OuterStruct?;

    init() {
        self.data = null;
    }
}