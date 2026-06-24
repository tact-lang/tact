struct InnerStruct {
    a: Int;
    b: Bool?;
}

contract DeepNestedOptional {
    nested: InnerStruct?;

    init() {
        self.nested = null;
    }
}
