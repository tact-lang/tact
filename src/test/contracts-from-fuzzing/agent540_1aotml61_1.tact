struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract SimpleNested {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ val1: 1, val2: true };
    }
}