struct Inner {
    f: Int;
}

struct Container {
    nested: Inner? = Inner{ f: 0 };
}

contract TestDefOptStruct {
    data: Container;
    init() {
        self.data = Container{};
    }
}