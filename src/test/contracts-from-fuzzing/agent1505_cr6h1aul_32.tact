contract MultiVarSize {
    x: Int as uint8;
    y: Int as int64;
    z: Int as coins; 

    init() {
        self.x = 255;
        self.y = -1234567890123456;
        self.z = ton("1");
    }

    receive() {
        self.x = 0;
        self.y = 0;
        self.z = 0;
    }
}