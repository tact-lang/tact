struct Wrap {
    a: Int;
}

struct Container {
    w: Wrap;
}

contract TinyWrap {
    f: Container;
    init() {
        self.f = Container{w: Wrap{a: 42}};
    }
}