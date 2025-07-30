contract OptFields {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.addr = null;
    }

    receive() {}
}