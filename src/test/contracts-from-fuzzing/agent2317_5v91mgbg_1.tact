struct Inner {
    a: Int = 0;
    b: Bool = false;
}

contract Test {
    point: Inner;

    init() {
        self.point = Inner{a: 1, b: true};
    }
}