// test persistence defaults and explicit init
contract DefaultTest {
    x: Int = 5;
    y: Bool = true;
    z: String = "abc";
    init() {
        self.x = 10;
        self.y = false;
        self.z = "def";
    }
}