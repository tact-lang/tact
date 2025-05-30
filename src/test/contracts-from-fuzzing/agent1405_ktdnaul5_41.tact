contract ManyOptionalMix {
    x: Int?;
    y: String?;
    z: Cell?;
    w: Slice?;
    p: Address?;
    b: Bool?;

    init() {
        self.x=null; self.y=null; self.z=null; self.w=null; self.p=null; self.b=null;
    }
}