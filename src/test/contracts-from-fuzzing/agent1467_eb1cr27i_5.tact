struct SerializeMix {
    u8: Int as uint8;
    u16: Int as uint16;
    s32: Int as int32;
    flag: Bool;
}

contract TestSerialize {
    mix: SerializeMix;
    
    init() {
        self.mix = SerializeMix{
            u8: 255,
            u16: 65535,
            s32: -123456,
            flag: false
        };
    }
}