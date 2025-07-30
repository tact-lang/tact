struct InnerOpt {
    optField: Int?;
}

struct Container {
    inner: InnerOpt?;
    normal: Int;
}

contract NestedOptionals {
    data: Container;

    init() {
        self.data = Container{
            inner: null,
            normal: 1
        };
    }
}