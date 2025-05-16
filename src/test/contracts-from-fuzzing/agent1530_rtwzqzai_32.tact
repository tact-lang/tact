struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    s: Inner = Inner{ x: 10, y: "foo" };
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}
