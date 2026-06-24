struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int;
}

contract TestContract {
    field: NestedOptionalStruct;

    init() {
        self.field = NestedOptionalStruct{
            inner: InnerStruct{x: 1, y: 2}
        };
    }
}