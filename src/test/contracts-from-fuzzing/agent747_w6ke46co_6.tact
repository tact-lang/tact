contract TestContract {
    fieldA: Int = 5;
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            intField: 42,
            boolField: true,
            optStr: null
        };
    }
}

struct NestedStruct {
    intField: Int;
    boolField: Bool;
    optStr: String?;
}
