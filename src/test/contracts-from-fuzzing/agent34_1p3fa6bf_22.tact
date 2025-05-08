struct Serialized {
    u4: Int as uint4;
    i64: Int as int64;
}

contract Test21 {
    ser: Serialized;
    init() {
        self.ser = Serialized{ u4: 7, i64: -123456 };
    }
}