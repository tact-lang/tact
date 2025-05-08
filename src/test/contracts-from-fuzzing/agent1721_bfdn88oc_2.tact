struct DeepNestedStruct {
    field1: Int;
    field2: StructLevel2;
}

struct StructLevel2 {
    subfield1: Bool;
    subfield2: StructLevel3;
}

struct StructLevel3 {
    leaf1: Int;
    leaf2: Int;
}

contract DeepNestedTest {
    data: DeepNestedStruct;

    init() {
        self.data = DeepNestedStruct{
            field1: 1,
            field2: StructLevel2{
                subfield1: true,
                subfield2: StructLevel3{
                    leaf1: 2,
                    leaf2: 3
                }
            }
        };
    }
}