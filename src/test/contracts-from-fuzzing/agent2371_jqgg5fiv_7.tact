struct SubNested {
    inner1: Int;
    inner2: String;
}

struct NestedWithOptional {
    intField: Int;
    optionalStruct: SubNested?;
}

contract TestContract {
    nestedOpt: NestedWithOptional;

    init() {
        self.nestedOpt = NestedWithOptional{
            intField: 7,
            optionalStruct: null,
        };
    }
}