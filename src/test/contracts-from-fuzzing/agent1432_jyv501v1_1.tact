struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    pt: Inner;
    z: Int;

    init() {
        self.pt = Inner{ x: 1, y: 2 };
        self.z = 3;
    }
}