struct UInts {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
}

contract SerFormats {
    data: UInts = UInts{ u8:5, u16:1000, u32:999999 };

    init() {
        self.data = self.data;
    }

    receive() {
        self.data = self.data;
    }
}