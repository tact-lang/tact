struct InnerStruct {
    value: Int;
}

contract SingleStructField {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ value: 42 };
    }
}