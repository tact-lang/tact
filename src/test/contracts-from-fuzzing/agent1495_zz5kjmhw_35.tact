contract MixedDefaultsAndInit {
    x: Int;
    y: Bool = false;
    z: String;

    init() {
        self.x = 10;
        self.z = "initialized";
    }
}
