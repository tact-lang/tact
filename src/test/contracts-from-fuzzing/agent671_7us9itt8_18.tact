struct Inner {
    desc: String?;
}

struct Container {
    inner: Inner;
    id: Int;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            inner: Inner{ desc: null },
            id: 123
        };
    }
}