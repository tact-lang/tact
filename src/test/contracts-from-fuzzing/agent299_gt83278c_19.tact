struct Inner {
    val: Int;
}

struct Container {
    left: Inner;
    right: Inner;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            left: Inner{ val: 1 },
            right: Inner{ val: 2 }
        };
    }
}