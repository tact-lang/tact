struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    c: Int;
    d: InnerStruct;
    e: Bool?;
}

contract NestedFieldsTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            c: 1,
            d: InnerStruct{ a: 2, b: true },
            e: null,
        };
    }
}
