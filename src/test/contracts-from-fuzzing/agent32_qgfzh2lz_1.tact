struct InnerStruct {
    nestedField: Int;
}

contract DeepContract {
    nested: InnerStruct;
    optNested: InnerStruct?;
    flag: Bool;

    init() {
        self.nested = InnerStruct{ nestedField: 5 };
        self.optNested = null;
        self.flag = true;
    }
}
