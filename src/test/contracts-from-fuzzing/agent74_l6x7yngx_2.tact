struct Inner {
    x: Int?;
}

contract TestContract {
    f: Inner;

    init() {
        self.f = Inner{ x: null };
    }
}