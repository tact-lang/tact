contract NestedSerialization {
    val1: Int as int8;
    nested: NestedStruct;

    init() {
        self.val1 = -5;
        self.nested = NestedStruct{
            innerVal: 1234
        };
    }
}

struct NestedStruct {
    innerVal: Int as uint224;
}