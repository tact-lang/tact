contract OptDefaults {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.addr = null;
        self.cellVal = null;
        self.sliceVal = null;
    }
}