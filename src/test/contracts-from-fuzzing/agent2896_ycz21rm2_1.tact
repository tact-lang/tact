struct InnerStruct {
    fieldA: Int;
    fieldB: Bool;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{
            fieldA: 1,
            fieldB: true,
        };
    }
}