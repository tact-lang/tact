// test many optional fields in persistent vars, all null initially
contract AllNulls {
    x: Int?;
    y: String?;
    z: Address?;
    w: Bool?;
    k: Cell?;
    s: Slice?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.w = null;
        self.k = null;
        self.s = null;
    }
}
