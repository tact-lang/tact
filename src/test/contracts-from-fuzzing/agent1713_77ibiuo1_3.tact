struct InnerNested {
    code: String;
    success: Bool = true;
}

struct OuterNested {
    num: Int;
    info: InnerNested;
    optionalStr: String?;
}

contract DeepNestedStruct {
    complex: OuterNested;

    init() {
        self.complex = OuterNested{
            num: 77,
            info: InnerNested{
                code: "ABC",
            },
            optionalStr: null,
        };
    }
}