struct Inner {
    flag: Bool?;
}

struct Outer {
    value: Int?;
    inner: Inner;
}

contract TestContract {
    data: Outer = Outer{ value: null, inner: Inner{ flag: true } };

    receive() {
        self.data = Outer{ value: 777, inner: Inner{ flag: null } };
    }
}
