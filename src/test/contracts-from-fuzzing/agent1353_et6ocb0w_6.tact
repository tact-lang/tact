struct OptionalInner {
    field: Int?;
}

struct Container {
    inner: OptionalInner?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: null
        };
    }
}