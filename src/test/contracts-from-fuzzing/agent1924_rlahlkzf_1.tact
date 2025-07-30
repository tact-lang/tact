struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    data: NestedOptionalStruct;
    
    init() {
        self.data = NestedOptionalStruct{
            inner: InnerStruct{ value: 42 }
        };
    }
}