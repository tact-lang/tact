struct NestedOpt {
    innerOpt: Int?;
}

struct Container {
    inner: NestedOpt?;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            inner: null
        };
    }
}