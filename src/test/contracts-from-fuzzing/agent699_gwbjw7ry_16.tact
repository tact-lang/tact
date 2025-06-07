struct Inner {
    x: Int;
    y: Int = 2;
    z: String?;
}

contract PartialInit {
    s: Inner;

    init() {
        self.s = Inner{ x: 1 };
    }
}
