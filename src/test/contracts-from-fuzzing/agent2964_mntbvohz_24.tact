struct EmptyOptWrap {
    a: Int?;
}

struct Container {
    inner: EmptyOptWrap?;
}

contract OptWrapOpt {
    data: Container;

    init() {
        self.data = Container{
            inner: null
        };
    }
}