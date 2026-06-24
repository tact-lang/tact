struct Inner {
    foo: Int? = null;
    bar: Bool? = true;
}

struct Outer {
    inner: Inner = Inner{};
    val: Int = 5;
}

contract DefaultsCascade {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}