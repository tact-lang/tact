struct NestedWithOptionStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    field: NestedWithOptionStruct;
    init() {
        self.field = NestedWithOptionStruct{ inner: null };
    }
}