struct Deep {
    inner: Inner;
}

struct Inner {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3;
}

struct Inner3 {
    val: Int;
}

contract TestContract {
    f: Deep;
    init() {
        self.f = Deep{ inner: Inner{ inner2: Inner2{ inner3: Inner3{ val: 123 } } } };
    }
}