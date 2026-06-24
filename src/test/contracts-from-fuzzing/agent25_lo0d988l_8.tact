struct NestedStruct3 {
    field1: NestedStruct2;
}

struct NestedStruct2 {
    field2: NestedStruct1;
}

struct NestedStruct1 {
    number: Int;
}

contract TestContract {
    val: NestedStruct3;

    init() {
        self.val = NestedStruct3{
            field1: NestedStruct2{
                field2: NestedStruct1{
                    number: 123
                }
            }
        };
    }
}