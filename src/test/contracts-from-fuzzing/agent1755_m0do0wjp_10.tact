struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    inner: Inner;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            inner: Inner{}
        };
    }
}
