contract DefaultsEdge {
    x: Int = 123;
    y: Bool;
    z: String;

    init() {
        self.y = false;
        self.z = "set";
    }
}