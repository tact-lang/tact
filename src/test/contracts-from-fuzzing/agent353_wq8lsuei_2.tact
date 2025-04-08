struct NestedStruct {
    a: Int;
    b: Bool;
    optionalField: Cell?;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            a: 5,
            b: true,
            optionalField: null,
        };
    }
}