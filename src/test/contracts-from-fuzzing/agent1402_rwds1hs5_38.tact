contract Serializations {
    x: Int as uint8;
    y: Int as int32;
    z: Int as coins; // variable size format
    t: Int; // default 257-bit signed

    init() {
        self.x = 5;
        self.y = -10;
        self.z = ton("1");
        self.t = 1000;
    }
}