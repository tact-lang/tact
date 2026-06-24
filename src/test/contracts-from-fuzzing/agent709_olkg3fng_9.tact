struct Inner {
    z: Int;
}

struct Container {
    inner: Inner?;
    count: Int = 10;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: null,
            count: 10
        };
    }
}