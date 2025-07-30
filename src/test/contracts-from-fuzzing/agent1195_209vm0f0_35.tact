contract StrangeDefaults {
    x: Int = -1;
    y: Int as uint32 = 0;
    z: Int as int128 = 987654321;
    b: Bool = true;
    s: String = "default string";

    init() {
        self.x = -12345;
        self.y = 54321;
        self.z = -987654321;
        self.b = false;
        self.s = "override";
    }
}
