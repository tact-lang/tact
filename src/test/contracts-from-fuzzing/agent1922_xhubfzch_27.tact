contract BigDefaults {
    x: Int as uint32 = 0;
    y: Int as uint64 = 0;
    z: Int as int16 = 0;
    s: String = "";
    b: Bool = false;

    init() {
        self.x=10; self.y=20; self.z=-5; self.s="abc"; self.b=true;
    }
}