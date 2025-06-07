struct InnerStruct {
    val: Int;
}

struct OuterStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
    inner3: InnerStruct;
}

contract StructOfStructs {
    outer: OuterStruct;

    init() {
        self.outer = OuterStruct{
            inner1: InnerStruct{ val: 1 },
            inner2: InnerStruct{ val: 2 },
            inner3: InnerStruct{ val: 3 }
        };
    }
}