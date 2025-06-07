// struct with mix of serialized int sizes

struct SerialInts {
    i64: Int as int64;
    u32: Int as uint32;
    u51: Int as uint51;
    maxi: Int as int257;
}

contract TestContract {
    data: SerialInts;

    init() {
        self.data = SerialInts {
            i64: 12345,
            u32: 42,
            u51: 1024,
            maxi: 7
        };
    }
}