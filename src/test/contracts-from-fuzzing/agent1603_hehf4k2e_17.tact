contract NestedStructOfNestedStruct {
    deepField: OuterStruct;

    init() {
        self.deepField = OuterStruct{
            middle: MiddleStruct{
                leaf: LeafStruct{ val: 123 }
            }
        };
    }
}

struct OuterStruct {
    middle: MiddleStruct;
}

struct MiddleStruct {
    leaf: LeafStruct;
}

struct LeafStruct {
    val: Int;
}