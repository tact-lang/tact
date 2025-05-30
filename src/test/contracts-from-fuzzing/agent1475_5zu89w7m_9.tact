contract MixContainer {
    x: Int = 1;
    y: Bool = false;
    z: String = "hi";

    init() {
        self.x = 42;
        self.y = true;
        self.z = "updated";
    }
}