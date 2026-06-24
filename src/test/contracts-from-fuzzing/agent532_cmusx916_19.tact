contract PartialDefaults {
    x: Int = 10;
    y: Bool;
    z: String;

    init() {
        self.y = true;
        self.z = "hello";
    }
}