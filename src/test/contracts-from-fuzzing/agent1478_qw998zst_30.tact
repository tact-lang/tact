struct Inner {
    foo: Int = 7;
}

struct Mid {
    inner: Inner = Inner{};
}

struct Outer {
    mid: Mid = Mid{};
}

contract TestContract {
    maybeOuter: Outer?;

    init() {
        self.maybeOuter = null;
    }
}
