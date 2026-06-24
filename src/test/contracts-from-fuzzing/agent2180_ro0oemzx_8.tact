struct Inner {
    x: Int;
    y: Bool;
}

struct Container {
    f1: Inner;
    f2: Inner;
}

contract SameStructFields {
    state: Container;

    init() {
        self.state = Container{
            f1: Inner{ x: 3, y: true },
            f2: Inner{ x: 4, y: false }
        };
    }
}