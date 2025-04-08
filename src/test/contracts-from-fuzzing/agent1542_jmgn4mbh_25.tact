struct Inner {
    x: Int = 1;
    y: Bool = false;
}

struct Outer {
    inner: Inner = Inner{};
    s: String = "bar";
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{};
    }
}