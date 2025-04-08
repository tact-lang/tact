struct InnerStruct {
    y: Int?;
}

struct OuterStruct {
    foo: Int;
    inner: InnerStruct;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            foo: 7,
            inner: InnerStruct{ y: null },
        };
    }
}