contract DefaultsTest {
    x: Int = 10;
    y: Bool = false;
    z: String = "abc";

    init() {
        self.x = 20;
        self.y = true;
        self.z = "def";
    }
}