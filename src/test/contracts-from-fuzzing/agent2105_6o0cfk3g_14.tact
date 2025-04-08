struct NestedStructWithOptional {
    field1: Int;
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    subfield1: Bool;
    subfield2: Int;
}

contract TestContract {
    s: NestedStructWithOptional;

    init() {
        self.s = NestedStructWithOptional{
            field1: 5,
            nestedOpt: InnerStruct{
                subfield1: true,
                subfield2: 10
            }
        };
    }
}