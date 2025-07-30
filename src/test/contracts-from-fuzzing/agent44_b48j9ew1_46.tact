contract MixOpt {
    x: Int?;
    y: Bool?;
    z: String?;

    init() {
        self.x = 1;
        self.y = null;
        self.z = null;
    }

    receive() {
        self.y = true;
        self.z = "xx";
    }
}