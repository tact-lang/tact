struct Inner {
    n: Int? = null;
    s: String = "default";
}

struct Outer {
    f: Bool = true;
    inner: Inner = Inner{};
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}
