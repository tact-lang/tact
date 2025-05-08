struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int?;
    flag: Bool;
}

contract DeepContract {
    value: Outer;

    init() {
        self.value = Outer{
            inner: Inner{x: 5},
            y: null,
            flag: false
        };
    }

    receive() {
        if (self.value.y == null) {
            self.value.inner.x = self.value.inner.x + 10;
        }
    }
}