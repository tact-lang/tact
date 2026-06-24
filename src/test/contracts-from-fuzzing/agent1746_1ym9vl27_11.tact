struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ middle: Middle{ inner: Inner{ a: 1 }} };
    }
}