struct Inner {
    flag: Bool = false;
}

struct Outer {
    inner: Inner = Inner{};
}

contract ModifyInit {
    s: Outer;

    init() {
        self.s = Outer{ inner: Inner{ flag: true } };
    }
}