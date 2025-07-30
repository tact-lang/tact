struct LowBits {
    u1: Int as uint1;
    u8: Int as uint8;
    s16: Int as int16;
}

struct Wrap {
    inner: LowBits;
    flag: Bool?;
}

contract TestContract {
    wide: Wrap = Wrap{inner: LowBits{u1:0, u8:0, s16:0}, flag: null};

    init() {
        self.wide = Wrap{inner: LowBits{u1:1, u8:255, s16:-12345}, flag: null};
    }

    receive() {
        let _ = self.wide;
    }
}