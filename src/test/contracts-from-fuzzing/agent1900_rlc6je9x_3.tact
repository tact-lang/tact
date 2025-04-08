struct NestedOptional {
    opt1: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool?;
}

contract OptionalInStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            opt1: InnerStruct{
                val: 42,
                flag: null,
            },
        };
    }
}