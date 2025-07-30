struct InnerStruct {
    foo: Int;
    bar: Bool;
}

struct OuterStruct {
    a: Int;
    nested1: InnerStruct;
    nested2: InnerStruct;
}

contract NestedStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            a: 42,
            nested1: InnerStruct{foo: 1, bar: true},
            nested2: InnerStruct{foo: 2, bar: false},
        };
    }
}