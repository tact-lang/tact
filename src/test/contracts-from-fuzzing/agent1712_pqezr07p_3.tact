struct Inner {
    x: Int = 1;
    y: Int = 2;
}

struct Outer {
    inner: Inner;
    z: Bool = false;
}

contract TestContract {
    data: Outer = Outer{ inner: Inner{ x: 10, y: 20 }, z: true };

    init() {
        self.data = Outer{ inner: Inner{ x: 5, y: 15 }, z: false };
    }

    receive() {
        let _ = self.data.inner.x + 1;
    }
}