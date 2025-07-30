struct NestedStruct {
    value: Int;
    optionalChild: ChildStruct?;
}

struct ChildStruct {
    childValue: Int;
}

contract DeepOptionalContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            value: 1,
            optionalChild: null
        };
    }
}