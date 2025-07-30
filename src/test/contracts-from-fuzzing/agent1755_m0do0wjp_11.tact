struct Inner {
    foo: Int?;
    bar: Bool?;
    s: String?;
}

struct Container {
    inner: Inner;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            inner: Inner{
                foo: 123,
                s: null
            }
        };
    }
}
