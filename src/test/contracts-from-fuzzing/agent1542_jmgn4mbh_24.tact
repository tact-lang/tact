contract Test {
    x: Int;
    y: Int?;
    z: Bool;
    w: Bool?;
    addr: Address;
    optAddr: Address?;
    s: String;
    optS: String?;

    init() {
        self.x = 3;
        self.y = null;
        self.z = false;
        self.w = null;
        self.addr = myAddress();
        self.optAddr = null;
        self.s = "foo";
        self.optS = null;
    }
}