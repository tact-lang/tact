struct Inner {
    a: Int?;
    b: Bool;
}

contract PartialInit {
    f: Inner;

    init() {
        self.f = Inner{ a: null, b: false };
    }
}