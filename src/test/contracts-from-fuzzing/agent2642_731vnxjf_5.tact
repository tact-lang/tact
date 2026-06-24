struct NestedInner {
    x: Int;
    y: String;
}

struct Container {
    first: NestedInner;
    second: NestedInner;
}

contract TestNest {
    data: Container;
    init() {
        self.data = Container{
            first: NestedInner{ x: 1, y: "one" },
            second: NestedInner{ x: 2, y: "two" },
        };
    }
}