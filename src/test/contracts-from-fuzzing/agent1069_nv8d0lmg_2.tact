struct NestedS {
    val1: Int;
    val2: Int?;
}

contract StructField {
    nested: NestedS;

    init() {
        self.nested = NestedS{val1: 3, val2: null};
    }
}