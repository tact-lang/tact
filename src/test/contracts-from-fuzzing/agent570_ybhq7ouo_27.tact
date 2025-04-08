struct MixSerialDefault {
    tiny: Int as int4 = 5;
    big: Int as uint64 = 123456;
}

contract SerialDefaultStruct {
    mix: MixSerialDefault;

    init() {
        self.mix = MixSerialDefault{}; // omit, rely on defaults
    }

    receive() {}
}