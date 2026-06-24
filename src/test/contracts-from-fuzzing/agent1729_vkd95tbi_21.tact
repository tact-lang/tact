struct StructDepth {
    field1: Int;
    field2: Int;
}

contract ManyFieldsContract {
    f1: StructDepth; f2: StructDepth;
    f3: StructDepth; f4: StructDepth;
    f5: StructDepth; f6: StructDepth;
    f7: StructDepth; f8: StructDepth;
    f9: StructDepth; f10: StructDepth;

    init() {
        self.f1 = StructDepth{field1:1,field2:2};
        self.f2 = StructDepth{field1:1,field2:2};
        self.f3 = StructDepth{field1:1,field2:2};
        self.f4 = StructDepth{field1:1,field2:2};
        self.f5 = StructDepth{field1:1,field2:2};
        self.f6 = StructDepth{field1:1,field2:2};
        self.f7 = StructDepth{field1:1,field2:2};
        self.f8 = StructDepth{field1:1,field2:2};
        self.f9 = StructDepth{field1:1,field2:2};
        self.f10 = StructDepth{field1:1,field2:2};
    }
}