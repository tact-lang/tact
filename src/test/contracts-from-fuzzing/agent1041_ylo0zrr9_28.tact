struct StructX {
    val: Int;
    optional: Int?;
}

struct StructY {
    arr1: StructX;
    arr2: StructX;
}

contract TwoNestedStructs {
    data: StructY;

    init() {
        self.data = StructY{
            arr1: StructX{ val:1, optional:null },
            arr2: StructX{ val:2, optional:null }
        };
    }
}
