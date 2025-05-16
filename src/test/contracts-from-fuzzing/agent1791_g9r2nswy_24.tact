struct STest {
    x: Int;
    y: String;
}

contract Test25 {
    z: STest;
    init() {
        self.z = STest{ x: 42, y: "hi" };
    }
}
