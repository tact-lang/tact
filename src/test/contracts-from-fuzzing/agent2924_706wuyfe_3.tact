struct NestedDefaults {
    val1: Int = 5;
    optVal: Int?;
    nested: InnerStruct;
}

struct InnerStruct {
    innerVal: Int = 10;
}

contract StructWithDefaults {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            optVal: null,
            nested: InnerStruct{}
        };
    }
}