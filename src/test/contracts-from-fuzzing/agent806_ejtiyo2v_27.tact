struct BoolNested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Bool;
}

contract TestContract {
    field: BoolNested;
    init() {
        self.field = BoolNested{
            inner: InnerStruct{
                value: true
            }
        };
    }
}