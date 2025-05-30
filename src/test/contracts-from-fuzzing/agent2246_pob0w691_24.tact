contract DefaultsTest {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";

    init() {
        self.x = 50;
        self.y = false;
        self.z = "changed";
    }
}
