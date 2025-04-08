struct OuterStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int?;
    bar: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{ foo: null, bar: true }
        };
    }
}