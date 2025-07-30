struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    x: Int;
    y: Bool?;
    z: Inner;
    w: Inner?;
    init() {
        self.x = 5;
        self.y = null;
        self.z = Inner{ a: 1, b: true };
        self.w = null;
    }
}