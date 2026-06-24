struct Inner { a: Int; }

struct Container {
    nestedOpt: Inner?;
}

contract TestContract {
    co: Container;

    init() {
        self.co = Container{ nestedOpt: null };
    }
}