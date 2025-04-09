contract MismatchDefaults {
    x: Int = 7;
    y: String;
    z: Bool = true;

    init() {
        self.y = "init";
    }
}