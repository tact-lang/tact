struct DeepOptStruct {
    inner1: Int?;
    inner2: String?;
    inner3: Address?;
}

struct NestedStruct {
    deep: DeepOptStruct;
    fixed: Int;
}

contract OptionalsDeeplyNested {
    rec: NestedStruct;

    init() {
        self.rec = NestedStruct{
            deep: DeepOptStruct{
                inner1: null,
                inner2: null,
                inner3: null
            },
            fixed: 100
        };
    }
}