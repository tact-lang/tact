struct Inner {
    dummy: Int?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalEmptyInner {
    container: Outer;

    init() {
        self.container = Outer{ inner: null };
    }
}