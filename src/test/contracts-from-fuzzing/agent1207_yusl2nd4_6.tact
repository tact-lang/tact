struct InnerMost {
    z: Int;
}

struct Inner {
    mid: InnerMost;
}

struct Container {
    inner: Inner;
}

contract MultiLevelNested {
    c: Container;

    init() {
        self.c = Container{
            inner: Inner{
                mid: InnerMost{
                    z: 123
                }
            }
        };
    }
}