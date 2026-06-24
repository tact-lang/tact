struct InnerStruct {
    b: Bool;
    x: Int?;
}

struct OuterStruct {
    foo: Int;
    bar: InnerStruct;
    baz: Bool?;
}

contract StructInStorage {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            foo: 1,
            bar: InnerStruct{
                b: true,
                x: null,
            },
            baz: false,
        };
    }
}