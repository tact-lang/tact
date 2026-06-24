struct DeepOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct Container {
    inner: DeepOpt?;
}

contract NestedOptionals {
    data: Container;

    init() {
        self.data = Container{
            inner: null
        };
    }
}