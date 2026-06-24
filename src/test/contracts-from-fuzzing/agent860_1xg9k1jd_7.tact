struct NestedOptionalStruct {
    nested: InnerOptionalStruct?;
}

struct InnerOptionalStruct {
    value: Int?;
}

contract TestContract {
    persistent: NestedOptionalStruct;

    init() {
        self.persistent = NestedOptionalStruct{
            nested: InnerOptionalStruct{ value: null }
        };
    }
}