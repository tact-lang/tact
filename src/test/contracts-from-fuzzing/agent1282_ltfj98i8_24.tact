// Nested structs with mixed serialization formats
struct NestedSer {
    x: Int as int64;
    y: Int as uint32;
}

struct OuterSer {
    a: NestedSer;
    b: NestedSer;
}

contract MixedSerializationFields {
    field: OuterSer;

    init() {
        self.field = OuterSer{
            a: NestedSer{x:1,y:2},
            b: NestedSer{x:3,y:4}
        };
    }
}