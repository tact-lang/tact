struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedTest {
    data: Inner;
    init() {
        self.data = Inner{ x: 1, y: true, z: "hi" };
    }
}
