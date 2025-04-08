contract DefaultAndInit {
    x: Int = 5;
    y: String?;
    z: Bool;

    init() {
        self.y = null;
        self.z = true;
    }
}