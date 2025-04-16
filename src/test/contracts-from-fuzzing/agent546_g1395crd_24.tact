contract NoDefaultsOpt {
    x: Int?;
    y: String?;
    z: Bool?;
    addr: Address?;
    cell: Cell?;
    sl: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.addr = null;
        self.cell = null;
        self.sl = null;
    }
}