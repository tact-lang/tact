contract InitUninitialized {
    x: Int;
    y: Bool;
    z: String;

    init() {
        self.x = 42;
        self.y = false;
        self.z = "hello";
    }
}
