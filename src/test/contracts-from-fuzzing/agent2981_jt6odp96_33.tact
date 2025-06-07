contract OptionalDeep {
    x: Int?;
    y: Bool?;
    z: Address?;
    w: Slice?;
    v: Cell?;
    s: String?;

    init() {
        self.x=null; self.y=null; self.z=null;
        self.w=null; self.v=null; self.s=null;
    }
}