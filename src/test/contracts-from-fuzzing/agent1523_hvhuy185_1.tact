contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            val: InnerStruct{ innerVal: 99, anotherVal: false },
            optInner: null
        };
    }
}

struct InnerStruct {
    innerVal: Int;
    anotherVal: Bool;
}

struct NestedStruct {
    val: InnerStruct;
    optInner: InnerStruct?;
}
