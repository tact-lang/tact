contract InitializedDefaultsTest {
    x: Int = 5;
    y: Bool = true;
    z: String = "init";

    init() {
        self.x = 10;
        self.y = false;
        self.z = "changed";
    }
}