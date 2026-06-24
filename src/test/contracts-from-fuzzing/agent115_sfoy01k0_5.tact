struct MixedSerial {
    val1: Int as uint8;
    val2: Int as int16;
    val3: Int as uint32;
    val4: Int as coins;
    val5: Int as int257;
}

contract SerialContract {
    mixed: MixedSerial;

    init() {
        self.mixed = MixedSerial{val1:1, val2:-2, val3:3, val4:4, val5:-5};
    }
}
