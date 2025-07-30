struct NestedSerialStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    i: Int as int8;
    j: Int as int32;
}

contract NestedSerializeTest {
    data: NestedSerialStruct;

    init() {
        self.data = NestedSerialStruct{
            inner: InnerStruct{ i: 5, j: 1000 }
        };
    }
}