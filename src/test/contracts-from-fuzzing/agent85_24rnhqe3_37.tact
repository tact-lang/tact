contract NoInit {
    x: Int;
    y: Bool;
    z: String;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "hello";
    }
}