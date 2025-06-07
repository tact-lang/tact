struct InnerStruct {
    a: Int;
    b: Int?;
}

struct OuterStruct {
    inner: InnerStruct;
    c: Bool;
    d: String?;
}

contract TestStorage {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{ a: 1, b: null },
            c: true,
            d: null
        };
    }
}
