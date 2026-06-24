struct NestedOptionalStruct {
    val: Int?;
    optStr: String?;
}

contract StructWithOptional {
    data1: NestedOptionalStruct?;
    data2: NestedOptionalStruct;

    init() {
        self.data1 = null;
        self.data2 = NestedOptionalStruct{ val: 7, optStr: null };
    }
}