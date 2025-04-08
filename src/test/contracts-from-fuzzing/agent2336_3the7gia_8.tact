struct Serializable {
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
    big: Int as int257;
}

contract TestContract {
    data: Serializable;

    init() {
        self.data = Serializable{
            i8: -5,
            u16: 42,
            i32: -1000,
            u64: 100000,
            big: 123456
        };
    }
}