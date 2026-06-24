contract MixedSerialization {
    i1: Int as uint32;
    i2: Int as int64;
    i3: Int as uint8;
    flag: Bool;
    addr: Address;
    s: String;

    init() {
        self.i1 = 100;
        self.i2 = -500;
        self.i3 = 255;
        self.flag = true;
        self.addr = myAddress();
        self.s = "serialization";
    }
}