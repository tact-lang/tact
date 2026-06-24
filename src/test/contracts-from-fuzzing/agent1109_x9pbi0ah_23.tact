struct NestedOptional {
    opt1: Int?;
    opt2: Bool?;
    optStruct: InnerStruct?;
}

struct InnerStruct {
    field: Int;
}

contract NestedOptionalStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            opt1: null,
            opt2: null,
            optStruct: null
        };
    }
}