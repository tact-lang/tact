contract DefaultsTest {
    x: Int = 5;
    y: Bool = true;
    z: String = "hello";

    init() {
        self.x = 10;
        self.y = false;
        self.z = "bye";
    }
}