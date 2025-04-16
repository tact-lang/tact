struct Inner {
    payload: Slice?;
}

struct Container {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{ inner: Inner{ payload: null }, flag: true };
    }
}