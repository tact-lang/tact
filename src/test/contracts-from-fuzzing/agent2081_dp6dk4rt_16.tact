contract InitDefaultsOptionals {
    x: Int = 1;
    y: String;
    z: Bool = false;
    w: Int?;
    s: String?;
    b: Bool?;
    init() {
        self.y = "bar";
        self.w = null;
        self.s = null;
        self.b = null;
    }
}