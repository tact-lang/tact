struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{ x: 1, y: null }
        };
    }
}