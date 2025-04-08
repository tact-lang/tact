contract DefaultsOverride {
    x: Int = 7;
    y: Bool = false;
    z: String = "abc";

    init() {
        self.x = 42;
        self.y = true;
        self.z = "def";
    }
}