struct SerializeOpts {
    num8: Int as uint8;
    num16: Int as uint16;
    num32: Int as uint32;
    num64: Int as uint64;
    num128: Int as uint128;
    num257: Int as int257;
}

contract SerializeOptsTest {
    data: SerializeOpts;

    init() {
        self.data = SerializeOpts{
            num8: 1,
            num16: 2,
            num32: 3,
            num64: 4,
            num128:5,
            num257:6
        };
    }
}
