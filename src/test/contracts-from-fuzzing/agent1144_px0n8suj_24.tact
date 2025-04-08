// test nested structs with serialization hints on inner
struct SerializedInner {
    x: Int as int64;
    y: Int as uint32;
}

struct OuterStruct {
    inn: SerializedInner;
    z: Int;
}

contract SerializeNestedInner {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            inn: SerializedInner{ x: -999, y: 123 },
            z: 555
        };
    }
}