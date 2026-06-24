struct Inner {
    val: Int;
}

struct Container {
    inner1: Inner;
    inner2: Inner;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            inner1: Inner{ val: 1 },
            inner2: Inner{ val: 2 },
        };
    }
}