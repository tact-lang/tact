struct Inner {
    x: Int? = null;
}

struct Outer {
    inner: Inner? = null;
}

contract TestContract {
    val: Outer = Outer{};

    init() {
        self.val = Outer{};
    }
}
