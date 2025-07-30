struct NestedStruct1 {
    val1: Int;
}

struct NestedStruct2 {
    nested1: NestedStruct1;
    optVal: Int?;
}

contract PersistentStructFields {
    data: NestedStruct2;

    init() {
        self.data = NestedStruct2{
            nested1: NestedStruct1{ val1: 5 },
            optVal: null
        };
    }
}