struct InnerStruct {
    a: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    b: Bool;
}

contract NestedStructStorage {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{ a: 42 },
            b: true,
        };
    }
}
