struct DeepTypes {
    u8: Int as uint8;
    u64: Int as uint64;
    i32: Int as int32;
    i257: Int as int257;
}

contract AllIntKinds {
    d: DeepTypes;
    init() {
        self.d = DeepTypes{
            u8: 1, u64: 2, i32: 3, i257: 4
        };
    }
}