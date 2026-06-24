struct Inner {
    a: Int = 1;
    b: Bool = false;
}

struct Outer {
    inner: Inner;
    flag: Bool = true;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ a: 42, b: true },
            flag: false
        };
    }
}