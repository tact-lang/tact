struct InnerStruct {
    z: Int;
}

struct OuterStruct {
    foo: Int;
    bar: Bool;
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            foo: 1,
            bar: true,
            inner: InnerStruct{z: 123},
            optionalInner: null,
        };
    }
}