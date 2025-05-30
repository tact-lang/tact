struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            inner: null,
        };
    }
}