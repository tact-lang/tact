struct NestedOptionalStruct {
    field1: Int?; 
    field2: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            field1: null,
            field2: true,
            inner: InnerStruct{
                x: 1,
                y: false
            }
        };
    }
}