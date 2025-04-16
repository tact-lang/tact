struct Inner {
    flag: Bool;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract TestContract {
    payload: Outer;
    init() {
        self.payload = Outer{ inner: Inner{ flag: false }, num: 42 };
    }
}