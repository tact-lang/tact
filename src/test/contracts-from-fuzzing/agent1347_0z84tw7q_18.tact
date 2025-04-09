struct Inner {
    flag: Bool;
    message: String?;
}

struct Container {
    data: Cell?;
    inner: Inner?;
    count: Int;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            data: null,
            inner: null,
            count: 42
        };
    }
}