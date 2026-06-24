contract BaseTest {
    x: Int = 7;
    y: Int? = null;
    z: Bool? = null;
    s: String = "hi";
    b: Bool = true;

    init() {
        self.x = 1;
        self.y = 5;
        self.z = false;
        self.s = "changed";
        self.b = false;
    }
}