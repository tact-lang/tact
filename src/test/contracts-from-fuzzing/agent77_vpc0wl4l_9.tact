contract NoDefaults {
    x: Int;
    y: Bool;
    z: String;

    init() {
        self.x = 0;
        self.y = false;
        self.z = "";
    }

    receive() {
        self.x = self.x + 1;
    }
}
