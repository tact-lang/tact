contract MixedDefaults {
    x: Int;
    y: Bool = true;
    z: String;

    init() {
        self.x = 7;
        self.z = "hello";
    }
}