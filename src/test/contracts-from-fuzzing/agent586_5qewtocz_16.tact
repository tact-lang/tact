// With serialization specs per field
struct SerializeSpec {
    i8: Int as int8;
    u16: Int as uint16;
    i64: Int as int64;
    u4: Int as uint4;
    big: Int as int257;
}

contract SerializeSpecContract {
    ser: SerializeSpec;

    init() {
        self.ser = SerializeSpec{
            i8:-5,
            u16:65535,
            i64:1234567890,
            u4:5,
            big: 0
        };
    }
    receive() {
        self.ser = self.ser;
    }
}