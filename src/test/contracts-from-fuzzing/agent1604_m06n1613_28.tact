struct OptionalAsField {
    a: Int?;
    b: Bool?;
}

struct NestedOptionalStruct {
    s: OptionalAsField?;
    s2: OptionalAsField?;
}

contract NestedOptionals {
    data: NestedOptionalStruct;
    init() {
        self.data = NestedOptionalStruct{
            s: null,
            s2: null
        };
    }
    receive() {}
}