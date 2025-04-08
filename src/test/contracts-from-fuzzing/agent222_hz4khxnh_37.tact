contract InitDefaultsOpts {
    x: Int = 1;
    y: Bool?;
    z: String = "abc";
    t: Int?;
    p: Bool = false;

    init() {
        self.y = true;
        self.t = 77;
    }
}