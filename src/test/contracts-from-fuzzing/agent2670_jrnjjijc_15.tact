struct OptionalNestedStruct {
    inner: StructInner?;
}

struct StructInner {
    val: Int;
    flag: Bool;
}

contract TopLevel {
    nested: OptionalNestedStruct;

    init() {
        self.nested = OptionalNestedStruct{ inner: null };
    }
}