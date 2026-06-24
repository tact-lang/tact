contract Test {
    x: Int as uint32;
    y: Int? as uint8;
    z: Bool;
    w: Bool?;
    s: String;
    t: String?;
    addr: Address;
    optAddr: Address?;

    init() {
        self.x = 123;
        self.y = 42;
        self.z = true;
        self.w = null;
        self.s = "test";
        self.t = null;
        self.addr = myAddress();
        self.optAddr = null;
    }
}