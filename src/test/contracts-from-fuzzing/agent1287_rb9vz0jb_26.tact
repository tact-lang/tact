// mixing serialization annotations in struct fields
struct MixSerialize {
    u8: Int as uint8;
    i16: Int as int16;
    coinsVal: Int as coins;
    def: Int;
}

contract TestContract {
    m: MixSerialize;
    init() {
        self.m = MixSerialize{
            u8: 255,
            i16: 32000,
            coinsVal: 1000000,
            def: -11
        };
    }
}