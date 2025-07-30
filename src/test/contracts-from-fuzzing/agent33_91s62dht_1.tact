struct InnerStruct {
    flag: Bool;
    data: Int;
}

contract DeepNested {
    nested1: InnerStruct;
    nested2: InnerStruct;

    init() {
        self.nested1 = InnerStruct{ flag: true, data: 1 };
        self.nested2 = InnerStruct{ flag: false, data: 2 };
    }
}