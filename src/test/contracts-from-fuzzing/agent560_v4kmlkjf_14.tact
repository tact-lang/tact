contract NestedOptionalFields {
    x: Int?;
    y: Bool?;
    z: Address?;
    w: Cell?;
    s: Slice?;
    t: String?;

    init() {
        self.x = null;
        self.y = true;
        self.z = null;
        self.w = null;
        self.s = null;
        self.t = "hello";
    }
}