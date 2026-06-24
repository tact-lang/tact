struct Inner {
    x: Int;
    y: Int;
}

struct Container {
    p: Inner;
    q: Inner?;
}

contract DeepNested {
    field: Container;

    init() {
        self.field = Container{
            p: Inner{ x: 1, y: 2 },
            q: null,
        };
    }
}