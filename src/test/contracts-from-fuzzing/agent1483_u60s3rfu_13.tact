contract PartialDefaults {
    x: Int = 1;
    y: Bool;
    z: String;

    init() {
        self.y = true;
        self.z = "hello";
    }
}