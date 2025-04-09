struct Inner {
    flag: Bool = true;
    count: Int = 7;
}

struct Outer {
    inner: Inner = Inner{};
    label: String = "label";
}

contract TestContract {
    data: Outer = Outer{};
    init() {}
    receive() {
        let _ = self.data.inner.count;
    }
}