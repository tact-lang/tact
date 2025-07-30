struct Leaf {
    x: Int = 99;
}

struct Inner {
    leaf: Leaf? = null;
}

struct Outer {
    inner: Inner? = null;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}