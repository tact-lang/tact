struct InnerStruct { innerValue: Int; }

contract DeepNested {
    nested1: InnerStruct;
    nested2: InnerStruct;
    nested3: InnerStruct;

    init() {
        self.nested1 = InnerStruct{ innerValue: 1 };
        self.nested2 = InnerStruct{ innerValue: 2 };
        self.nested3 = InnerStruct{ innerValue: 3 };
    }
}