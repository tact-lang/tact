struct NestedStruct1 {
    foo: Int;
}

struct NestedStruct2 {
    bar: NestedStruct1;
}

contract StructInStruct {
    nested: NestedStruct2;

    init() {
        self.nested = NestedStruct2{
            bar: NestedStruct1{
                foo: 999
            }
        };
    }
}