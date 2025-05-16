contract NoDefaults {
    x: Int;
    y: Bool;
    z: String;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "abc";
    }
}