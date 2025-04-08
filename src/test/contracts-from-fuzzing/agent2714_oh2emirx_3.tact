struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract Test3 {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{ inner: InnerStruct{ val: 10, flag: true } };
    }
}