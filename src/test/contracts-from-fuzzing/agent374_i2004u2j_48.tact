struct Massive {
    f01: Int as uint8;
    f02: Int as int16;
    f03: Int as uint32;
    f04: Int as int64;
    f05: Int as uint8;
    f06: Int as int16;
    f07: Int as uint32;
    f08: Int as int64;
    f09: Int as uint8;
    f10: Int as int16;
    f11: Int as uint32;
    f12: Int as int64;
    f13: Int as uint8;
    f14: Int as int16;
    f15: Int as uint32;
    f16: Int as int64;
    f17: Int as uint8;
    f18: Int as int16;
    f19: Int as uint32;
    f20: Int as int64;
}

contract HugeStructTest {
    m: Massive;

    init() {
        self.m = Massive{
            f01:1, f02:2, f03:3, f04:4,
            f05:5, f06:6, f07:7, f08:8,
            f09:9, f10:10, f11:11, f12:12,
            f13:13, f14:14, f15:15, f16:16,
            f17:17, f18:18, f19:19, f20:20
        };
    }

    receive() {
        let _ = self.m.f20;
    }
}