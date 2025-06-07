struct NestedSerialization {
    s1: SerialStruct;
    s2: SerialStruct;
}

struct SerialStruct {
    a: Int as int8;
    b: Int as uint16;
}

contract TwoLayersSerialization {
    data: NestedSerialization;
    init() {
        self.data = NestedSerialization{
            s1: SerialStruct{ a: 10, b: 20 },
            s2: SerialStruct{ a: 30, b: 40 }
        };
    }
}