struct InnerInnerStruct {
    value: Int;
    flag: Bool;
}

struct InnerStruct {
    innerField: Int;
    nestedInner: InnerInnerStruct;
    text: String;
    maybe_slice: Slice?;
}

contract DeepMixed {
    field1: InnerStruct;
    field2: InnerStruct?;
    flag: Bool;

    init() {
        self.field1 = InnerStruct{
            innerField: 1,
            nestedInner: InnerInnerStruct{ value: 2, flag: true },
            text: "hello",
            maybe_slice: null
        };
        self.field2 = null;
        self.flag = true;
    }
}
