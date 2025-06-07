struct Inner {
    a: Int;
    b: Bool?;
}

contract Test {
    x: Int = 1;
    y: Bool = true;
    z: Inner;

    init() {
        self.z = Inner{ a: 10, b: null };
    }
}