struct IntSer {
    a: Int as int64;
    b: Int as uint8;
}

contract SerializedInts {
    data: IntSer;

    init() {
        self.data = IntSer{ a: 123456, b: 255 };
    }
}