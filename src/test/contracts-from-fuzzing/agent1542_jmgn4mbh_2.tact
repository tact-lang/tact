struct Inner {
    y: Int;
    z: Bool?;
}

contract Test {
    x: Inner;

    init() {
        self.x = Inner{ y: 5, z: true };
    }
}