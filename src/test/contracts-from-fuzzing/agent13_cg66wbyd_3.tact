struct Inner {
    aa: Int;
    bb: Bool;
}

contract Test {
    param: Inner;

    init() {
        self.param = Inner{ aa: 5, bb: false };
    }
}
