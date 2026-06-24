struct Inner {
    x: Int;
    y: Bool;
}

struct Container {
    one: Inner;
    two: Inner;
    flag: Bool;
}

contract DeepNestedVar {
    data: Container;

    init() {
        self.data = Container {
            one: Inner { x: 10, y: true },
            two: Inner { x: 20, y: false },
            flag: true
        };
    }
}
