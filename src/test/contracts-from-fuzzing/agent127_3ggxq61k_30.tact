struct NestedIntSer {
    inner: IntSerStruct;
}

contract NestedIntSerialization {
    s: NestedIntSer;

    init() {
        self.s = NestedIntSer{
            inner: IntSerStruct{ a:1, b:-1, c:2 }
        };
    }
}

struct IntSerStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
}