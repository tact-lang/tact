struct P {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptTest {
    val: P;
    init() {
        self.val = P{ x: null, y: true, z: null };
    }
    receive() {}
}