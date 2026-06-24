struct InnerNested {
    y: Int;
}

struct NestedStruct {
    x: InnerNested; 
}

contract DeepNestedContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ x: InnerNested{ y: 1 } };
    }
}