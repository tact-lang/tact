struct SerialMixed {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
}

struct NestedSer {
    inner: SerialMixed;
    flag: Bool;
}

contract DeepSerialize {
    data: NestedSer = NestedSer{
        inner: SerialMixed{ a:-1, b:65535, c:-1234, d:99999999 },
        flag: true
    };

    init() {
        self.data = NestedSer{
            inner: SerialMixed{ a:1, b:1234, c:-4321, d:88888888 },
            flag: false
        };
    }
}