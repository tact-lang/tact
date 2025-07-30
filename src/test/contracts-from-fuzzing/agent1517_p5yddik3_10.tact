struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Mid {
    inner: Inner;
    flag: Bool = false;
}

contract Test {
    mid: Mid;

    init() {
        self.mid = Mid { inner: Inner{} };
    }

    receive() {}
}