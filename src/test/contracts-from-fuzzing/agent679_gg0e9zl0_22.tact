// Struct with Ints with many different serialization sizes
struct WeirdInts {
    u1: Int as uint1;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
    i8: Int as int8;
    max: Int as int257;
}

contract TestContract {
    x: WeirdInts;

    init() {
        self.x = WeirdInts{
            u1: 1,
            u16: 42,
            i32: -1000,
            u64: 9999,
            i8: -10,
            max: 123456789,
        };
    }
}