struct NestedStruct {
    id: Int;
    sub: SubStruct;
}

struct SubStruct {
    x: Int;
}

contract InitOrder {
    field: Int = 1;
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            id: 10,
            sub: SubStruct{ x:20 }
        };
        self.field = 100;
    }
}