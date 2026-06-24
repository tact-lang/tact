struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer = Outer{ inner: Inner{ value: 1 }, flag: true };

    receive() {
        self.data = Outer{ inner: Inner{ value: 42 }, flag: false };
    }
}