contract MixedDefaults {
    x: Int = 1;
    y: Bool;
    z: String = "abc";

    init() {
        self.y = false;
    }
}