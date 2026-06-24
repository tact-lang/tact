contract MixDefaultsOpt {
    x: Int = 3;
    y: String = "hi";
    z: Int?;
    k: Bool?;

    init() {
        self.z = null;
        self.k = true;
    }
}
